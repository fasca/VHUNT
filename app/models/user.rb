class User < ApplicationRecord
	#relation BDD, ajout d'un avatar
	has_attachment :avatar

	#relation BDD, un user à plusieurs produits
	has_many :products

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
