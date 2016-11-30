class Client < ApplicationRecord
  # Direct associations

  belongs_to :advisor

  has_many   :allocations,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
