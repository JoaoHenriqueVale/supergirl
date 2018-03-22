# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action :logged_user

  def new
    @result = Result.new
    @survey = Survey.new
    @my_survey = Survey.find(params[:survey_id])
    @questions = Question.all
    users = User.all.reject { |user| user == current_user }
    users.each do |user|
      @survey.results.build(user: current_user, girl: user)
    end
  end

  def create
    survey = Survey.find(params[:survey_id])
    insert_results params_result['results'], survey
    redirect_to surveys_path
  end

  private

  def insert_results(params, survey)
    params.each do |result|
      girl = User.find(result['girl'])
      question = Question.find(result['question'])
      result = Result.new(user: current_user, survey: survey, girl: girl, rating: result['rating'], question: question)
      result.save
    end
  end

  def params_result
    params.require(:result).permit(results: %i[rating girl question])
  end
end
