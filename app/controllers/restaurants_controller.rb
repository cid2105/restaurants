class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants.xml
  def index
    if params.has_key?("restaurant") && Restaurant.find_by_name(params["restaurant"]["name"])
      @restaurant = Restaurant.find_by_name(params["restaurant"]["name"])
      redirect_to restaurant_path(@restaurant)
      return
    else
      @restaurants = Restaurant.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @restaurants }
      end
    end
  end

  def restaurant_listing
    @restaurants = Restaurant.find_all_by_category_id(:category_id => @category)
  end
  
  # GET /restaurants/1
  # GET /restaurants/1.xml
  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = @restaurant.dishes.sort_by(&:name)
    @reviews = @restaurant.reviews.all.sort_by{ |review| review.getScore }.reverse
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @restaurant }
    end
  end

  
  def add
    @restaurant = Restaurant.new
    if request.post?
      if !params[:restaurant][:name].blank? && !params[:restaurant][:street].blank? && !params[:restaurant][:city].blank? && !params[:restaurant][:state].blank? && !params[:restaurant][:zip].blank? && !params[:restaurant][:number].blank? && !params[:restaurant][:website].blank?
          @restaurant = Restaurant.new(params[:restaurant])
      else
        flash[:error] = 'One or more fields were left blank.'
        return
      end
      respond_to do |format|
        if @restuarant.save
          format.html { redirect_to(@restaurant, :notice => 'Restaurant was successfully created.') }
          format.xml  { render :xml => @restaurant, :status => :created, :location => @dish }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @restaurant.errors, :status => :unprocessable_entity }
        end
      end
    end
    
  end
  
  # GET /restaurants/new
  # GET /restaurants/new.xml
  def new
    @restaurant = Restaurant.new
    @category ||= Category.find(params[:category])
    @zip ||= params[:zip]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @restaurant }
    end
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.xml
  def create
    if !params[:restaurant][:name].blank? && !params[:restaurant][:street].blank? && !params[:restaurant][:city].blank? && !params[:restaurant][:state].blank? && !params[:restaurant][:zip].blank? && !params[:restaurant][:number].blank? && !params[:restaurant][:website].blank?
        @restaurant = Restaurant.new(params[:restaurant])
    else
        @restaurant = Restaurant.new
        @zip = params[:zip][:to_s]
        @category = Category.find(params[:category][:id])
        flash[:error] = 'One or more fields were left blank.'
        render "new"
        return
    end
    
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to(@restaurant, :notice => 'Restaurant was successfully created.') }
        format.xml  { render :xml => @restaurant, :status => :created, :location => @restaurant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @restaurant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.xml
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to(@restaurant, :notice => 'Restaurant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @restaurant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.xml
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to(restaurants_url) }
      format.xml  { head :ok }
    end
  end
end
