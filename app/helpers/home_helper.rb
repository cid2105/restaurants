module HomeHelper
  include ApplicationHelper
  
  def getRecent
    Review.find(:all, :order => "created_at DESC", :limit => 100)
  end
  
end
