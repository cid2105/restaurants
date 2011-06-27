class ApplicationController < ActionController::Base
  protect_from_forgery
   layout 'application'


     protected

     def client
       @client ||= FBGraph::Client.new(:client_id => '231595723531528',
                                      :secret_id => 'd9e0fc56653627cc0f1b190d7346e718' ,
                                      :token => session[:access_token])
     end
end