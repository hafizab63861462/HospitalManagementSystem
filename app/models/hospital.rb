class Hospital < ApplicationRecord
    has_many :hospital_treatments , dependent: :destroy
    has_many :treatments , through: :hospital_treatments , dependent: :destroy

     validates :name , :city , :address , :presence => true
    validates :name , :length => { :minimum => 2 }
    validates :name , :uniqueness => true
end
