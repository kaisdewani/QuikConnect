class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  ActionController::InvalidAuthenticityToken
  protect_from_forgery with: :null_session
end
