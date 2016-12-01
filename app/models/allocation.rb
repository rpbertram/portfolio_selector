class Allocation < ApplicationRecord
  # Direct associations

  belongs_to :fund

  belongs_to :client,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :percentage, :presence => true

  validates :percentage, :numericality => { :less_than_or_equal_to => 1 }

end
