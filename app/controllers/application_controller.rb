# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged?
    !current_user.nil?
  end

  def logged_user
    redirect_to new_session_url unless logged?
  end

  def admin?
    current_user.admin
  end

  def logged_admin
    redirect_to new_session_url unless logged? && admin?
  end

  helper_method :current_user, :logged?
end
