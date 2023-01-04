class Customer < ApplicationRecord
    has_many :bills , dependent: :destroy
    validates :name, :presence => true
    validates_uniqueness_of :name, :scope => :address
end
