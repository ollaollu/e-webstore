class Product < ActiveRecord::Base
	has_many :pictures, dependent: :destroy
	validates :name, :description, :price, :presence => true
end
