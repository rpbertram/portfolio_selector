class Allocation < ApplicationRecord
  # Direct associations

  belongs_to :moneymanager,
             :class_name => "Fund",
             :foreign_key => "fund_id"

  belongs_to :client

  # Indirect associations

  # Validations

end
