class Historicalperformance < ApplicationRecord
  # Direct associations

  belongs_to :moneymanager,
             :class_name => "Fund",
             :foreign_key => "fund_id"

  # Indirect associations

  # Validations

  validates :month, :uniqueness => true

  validates :month, :presence => true

  validates :month, :length => { :minimum => 6, :maximum => 6 }

  validates :performance, :presence => true

  validates :performance, :numericality => true

end
