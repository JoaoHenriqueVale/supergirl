# frozen_string_literal: true

class SurveysController < ApplicationController
  before_action :logged_user

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new survey_params
    if @survey.save
      redirect_to surveys_path
    else
      render :new
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find params[:id]
    if @survey.update survey_params
      redirect_to surveys_path
    else
      render :edit
    end
  end

  def destroy
    @survey = Survey.find params[:id]
    @survey.destroy
    redirect_to surveys_path
  end

  def show
    @survey = Survey.find(params[:id])
    results_hash = @survey.results.group(:girl).average(:rating)
    results_hash = results_hash.merge(results_hash) { |_k, v| v.to_f }
    results = results_hash.sort_by { |_k, v| v }.reverse
    @results_another = results.drop(1)
    @result_first = results.first
  end

  private

  def survey_params
    params.require(:survey).permit(:name, :status)
  end
end
