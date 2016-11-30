class Fund < ApplicationRecord
  # Direct associations

  has_many   :historicalperformances,
             :dependent => :destroy

  has_many   :allocations,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
