# frozen_string_literal: true

class SessionsController < ApplicationController
  layout 'login'
  def new
    @user = User.new
  end

  def create
    user = User.find_by(cpf: params['user']['cpf'])
    if user
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to new_session_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_url
  end
end
