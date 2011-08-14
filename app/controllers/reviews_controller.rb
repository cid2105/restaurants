class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
    @dish = Dish.new
    if request.post?    
      name = params[:restaurant][:name].split(",")[0].strip
      if Restaurant.find_by_name(name).nil?
        flash[:error] = 'Please choose a valid restaurant.'
        return
      end
      params[:review][:price] = params[:dish][:price]
      @restaurant = Restaurant.find_by_name(name)
      puts @restaurant.inspect
      @review = Review.create!(params[:review])
      unless Dish.find_by_name(params[:dish][:name])
           @dish = Dish.create!(params[:dish])
      else   
           @dish =  Dish.find_by_name(params[:dish][:name])
      end
      @dish.reviews.push(@review)
      @restaurant.dishes << @dish
      @review.dish = @dish
      @restaurant.reviews << @review
      @review.restaurant = @restaurant
      respond_to do |format|
        if @review.save and @dish.save and @restaurant.save
          flash[:notice] = 'Review was successfully created.'
          format.html { render :new }
          format.xml  { render :xml => @review, :status => :created, :location => "new" }
        else
           format.html { render :action => "new" }
           format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def getDishes
    if !Restaurant.find_by_name(params["restaurant"].split(",")[0])     
      render :text => "error" 
    end
    @dish_set = Restaurant.find_by_name(params["restaurant"].split(",")[0]).dishes
    @dishes = ""
    @dish_set.each do |dish|
      @dishes += dish.name + "$"
    end
    render :text => @dishes
  end
  
  def create
    @restaurant = Restaurant.find(params["restaurant"]["id"])
    params["review"]["price"] = params["dish"]["price"]
    @review = @restaurant.reviews.create!(params["review"])
    unless Dish.find_by_name(params["dish"]["name"])
         @dish = Dish.create!(params["dish"])
    else   
         @dish =  Dish.find_by_name(params["dish"]["name"])
    end
    @dish.reviews.push(@review)
    @restaurant.dishes << @dish
    if @dish.save! and @restaurant.save! and @review.save!
      redirect_to restaurant_path(@restaurant)
    end
  end
  
  def vote
    @review = Review.find(params[:rid])
    @score = params[:helpful] == "true" ? 1 : -1
    @id = current_user.id
    unless Vote.find_by_user_id_and_review_id(current_user.id,  @review.id)
      @vote = Vote.create!(:user_id => current_user.id, :review_id => @review.id, :score => @score)
      @review.votes << @vote
    else
      @vote = Vote.find_by_user_id_and_review_id(current_user.id,  @review.id)
      @vote.score = @score
    end
    @vote.user_id = current_user.id
    @vote.save!
    @review.save!
    scores = Hash["upvotes" => getUpVotes(params[:rid]), "downvotes" => getDownVotes(params[:rid])] 
    render :json => scores
  end
  
  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    redirect_to restaurant_path(@restaurant)
  end
  
  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
    @review.destroy
    @review.dish.destroy
    render restaurant_url(@restaurant)
  end
  
  def getUpVotes(rid)
      upvotes =  Vote.all(:conditions => ["score = 1 and review_id = ?", rid]) ? Vote.all(:conditions => ["score = 1 and review_id = ?", rid]).size : 0
  end

  def getDownVotes(rid)
        downvotes = Vote.all(:conditions => ["score = -1 and review_id = ?", rid] ) ? Vote.all(:conditions => ["score = -1 and review_id = ?", rid]).size : 0
  end
    
end
