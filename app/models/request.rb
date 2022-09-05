class Request < ApplicationRecord
     # belongs_to :users 
     belongs_to :doctor, class_name: "User", foreign_key: "user_id" , optional: true
     belongs_to :patient , class_name: "User", foreign_key: "patient_id" , optional: true

     enum status: { pending: 'pending' , accepted: 'accepted', rejected: 'rejected' }
end
