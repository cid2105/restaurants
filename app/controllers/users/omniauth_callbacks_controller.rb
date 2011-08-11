class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
      # You need to implement the method below in your model

      @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)
      data = env["omniauth.auth"]['extra']['user_hash']
      @info = @user.user_info(data)
      
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
        session['fb_access_token'] = env["omniauth.auth"]['credentials']['token']       
        puts env["omniauth.auth"].to_a
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.facebook_data"] = env["omniauth.auth"]

        redirect_to new_user_registration_url
      end
    end

    def handle_unverified_request
        true
    end
   

    def passthru
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
    
    


end