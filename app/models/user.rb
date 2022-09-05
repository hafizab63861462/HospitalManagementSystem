class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one :hospital_treatments
  has_many :requests 

   enum user_types: {Doctor: 'Doctor' , Patient: 'Patient'}


  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable, 
         :validatable
end
