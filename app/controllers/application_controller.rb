class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require "error/error_handler"
  include Error::ErrorHandler
  include SessionHelper
  serialization_scope :view_context
end
