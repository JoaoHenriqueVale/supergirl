# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :logged_user

  def index
    @surveys = Survey.where(status: true)
  end
end
