class BaseController < ApplicationController
  include ApplicationHelper

  before_filter :set_request_at
  helper_method :current_user

  def current_user
    @current_user ||= warden.authenticate(:scope => :user)
  end

  private
  def set_request_at
    session[:request_at] ||= Time.now.to_s
    @request_at = Time.parse(session[:request_at])
  end
end
