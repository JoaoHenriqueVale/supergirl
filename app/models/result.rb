# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :survey
  belongs_to :user
  belongs_to :question
  belongs_to :girl, class_name: 'User'
end
