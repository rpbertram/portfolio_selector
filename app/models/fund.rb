class Fund < ApplicationRecord
  # Direct associations

  has_many   :historicalperformances,
             :dependent => :destroy

  has_many   :allocations,
             :dependent => :destroy

  # Indirect associations

  has_many   :clients,
             :through => :allocations,
             :source => :client

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

  validates :proxyflag, :presence => true

  validates :proxyflag, :numericality => { :less_than_or_equal_to => 1 }

  validates :proxyflag, :inclusion => { :in => [ '0', '1' ]  }

  validates :risktolerance, :presence => true

end
