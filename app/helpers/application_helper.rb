# frozen_string_literal: true

module ApplicationHelper
  def verify_link_survey_user(survey)
    if verify_survey_user? survey
      survey_path(survey)
    else
      new_survey_result_path(survey)
    end
  end

  def verify_survey_user?(survey)
    survey.results.where(user: current_user).exists?
  end

  def hidden_link
    current_user.admin ? '' : 'hidden-link'
  end

  def display_none_user
    current_user.admin ? '' : 'display:none'
  end
end
