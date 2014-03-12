class Practice < ActiveRecord::Base
  extend Enumerize

  belongs_to :sentence

  enumerize :practice_type, in: {DIVORZIO_CONGIUNTO: 10, DIVORZIO_GIUDIZIALE: 20}

  validates :practice_type, presence: true
end
