class AddPatientIdToRequest < ActiveRecord::Migration[5.2]
  def change
    add_reference :requests, :patient, index: true
    add_foreign_key :requests , :users , column: :patient_id
  end
end
