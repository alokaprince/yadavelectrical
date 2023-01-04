class Bill < ApplicationRecord
  validates :billno, :presence => true, :uniqueness => true
  belongs_to :customer
  has_many :items , dependent: :destroy
end
