class Historicalperformance < ApplicationRecord
  # Direct associations

  belongs_to :moneymanager,
             :class_name => "Fund",
             :foreign_key => "fund_id"

  # Indirect associations

  # Validations

end
