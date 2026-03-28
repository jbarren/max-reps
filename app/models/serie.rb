class Serie < ApplicationRecord
  MARKS = %w[FALLO GOMA].freeze

  validates :reps, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :mark, inclusion: { in: MARKS }, allow_nil: true
end
