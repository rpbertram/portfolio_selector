class Client < ApplicationRecord
  # Direct associations

  belongs_to :advisor,
             :counter_cache => true

  has_many   :allocations,
             :dependent => :destroy

  # Indirect associations

  has_many   :fundselections,
             :through => :allocations,
             :source => :moneymanager

  # Validations

  validates :accountsize, :presence => true

  validates :accountsize, :numericality => { :greater_than => 25000 }

  validates :advisor_id, :presence => true

  validates :advisor_id, :length => { :minimum => 2 }

  validates :clientname, :uniqueness => true

  validates :clientname, :presence => true

  validates :mgmt_fee, :presence => true

  validates :mgmt_fee, :numericality => { :less_than_or_equal_to => 2, :greater_than_or_equal_to => 0 }

  validates :risktolerance, :presence => true

end
