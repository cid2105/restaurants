class User < ActiveRecord::Base
  devise :omniauthable, :rememberable
  has_many :votes
  after_initialize :init

  def init
    self.admin  ||= false          #will set the default value only if it's nil
  end
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end

  end
  
  def profile(token)
    fb_user ||= FbGraph::User.new('me', :access_token => token).fetch
  end
  
   def user_info(user_data)
        {
          'nickname' => user_data["link"].split('/').last,
          'email' => (user_data["email"] if user_data["email"]),
          'first_name' => user_data["first_name"],
          'last_name' => user_data["last_name"],
          'name' => "#{user_data['first_name']} #{user_data['last_name']}",
          'image' => "http://graph.facebook.com/#{user_data['id']}/picture?type=square",
          'urls' => {
            'Facebook' => user_data["link"],
            'Website' => user_data["website"],
          }
        }
      end
      
  def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
          user.email = data["email"]
          user.first_name = data["first_name"]
          user.last_name = data["last_name"]
          user.name = "#{data['first_name']} #{data['last_name']}"
          user.url = data["link"]
          user.pic = data["image"]
        end
      end
    end
end