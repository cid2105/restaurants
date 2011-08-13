RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to root_path unless warden.user.admin
  end
end