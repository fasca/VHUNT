class Product < ApplicationRecord
	#relation BDD pour cloudinary
	has_attachment :photo

	#relation BDD, un produit est publié par un user
	belongs_to :user

	validates :user , presence: true
	validates :name, presence: true, uniqueness: true
	validates :url, presence: true, uniqueness: true
	validates :category, inclusion: { in: %w(tech education design),
    message: "%{value} is not a valid category." }
end
