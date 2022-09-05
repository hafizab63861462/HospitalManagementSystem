class HospitalTreatment < ApplicationRecord
    belongs_to :hospital , optional: true
    belongs_to :treatment , optional: true
    has_one :user 
end
