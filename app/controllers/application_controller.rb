class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  include SessionsHelper

  def nothing
    # render text: '', content_type: 'text/plain'
  end

end
