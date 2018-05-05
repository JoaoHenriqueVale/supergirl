# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :results, dependent: :destroy
end
