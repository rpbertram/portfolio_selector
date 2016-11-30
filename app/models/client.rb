class Client < ApplicationRecord
  # Direct associations

  belongs_to :advisor

  has_many   :allocations,
             :dependent => :destroy

  # Indirect associations

  has_many   :moneymanagers,
             :through => :allocations,
             :source => :moneymanager

  # Validations

end
