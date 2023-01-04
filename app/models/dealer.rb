class Dealer < ApplicationRecord
    has_many :dealerbills , dependent: :destroy
    validates :name, :presence => true
    validates_uniqueness_of :name, :scope => :address
end
