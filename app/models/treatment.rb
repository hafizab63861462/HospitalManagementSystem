class Treatment < ApplicationRecord
    has_many :hospital_treatments 
    has_many :hospitals  , through: :hospital_treatments

     validates :name , :price , :presence => true
     validates :name , :length => { :minimum => 2 }
     validates :price , numericality: { only_integer: true }
end
