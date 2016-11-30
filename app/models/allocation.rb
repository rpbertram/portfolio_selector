class Allocation < ApplicationRecord
  # Direct associations

  belongs_to :moneymanager,
             :class_name => "Fund",
             :foreign_key => "fund_id"

  belongs_to :client

  # Indirect associations

  # Validations

  validates :percentage, :presence => true

  validates :percentage, :numericality => { :less_than_or_equal_to => 1 }

end
