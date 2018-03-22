# frozen_string_literal: true

class Survey < ApplicationRecord
  has_many :results, dependent: :destroy
  accepts_nested_attributes_for :results
end
