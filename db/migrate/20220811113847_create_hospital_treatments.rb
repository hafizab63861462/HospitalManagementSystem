class CreateHospitalTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_treatments do |t|
      t.references :hospital
      t.references :treatment

      t.timestamps
    end
  end
end
