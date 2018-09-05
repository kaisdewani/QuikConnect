class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  ActionController::InvalidAuthenticityToken
end
