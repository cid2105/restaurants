class ApplicationController < ActionController::Base
  protect_from_forgery
   layout 'application'

   unless  ActionController::Base.consider_all_requests_local
     rescue_from Exception, :with => :render_404
   end
   
   
     protected
     
     def render_404
         render :template => 'error_pages/404', :status => :not_found, :alert => "Congrats you broke the site"
       end
       
     def client
       @client ||= FBGraph::Client.new(:client_id => '231595723531528',
                                      :secret_id => 'd9e0fc56653627cc0f1b190d7346e718' ,
                                      :token => session[:access_token])
     end
end