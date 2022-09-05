class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
