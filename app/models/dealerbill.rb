class Dealerbill < ApplicationRecord
  belongs_to :dealer
  has_many :dealeritems , dependent: :destroy
end
