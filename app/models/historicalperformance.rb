class Historicalperformance < ApplicationRecord
  # Direct associations

  belongs_to :fund

  # Indirect associations

  # Validations

  validates :month, :uniqueness => true

  validates :month, :presence => true

  validates :month, :length => { :minimum => 6, :maximum => 6 }

  validates :performance, :presence => true

  validates :performance, :numericality => true

end
