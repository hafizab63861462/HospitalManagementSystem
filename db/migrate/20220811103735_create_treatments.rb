class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.string :name
      t.integer :price , :integer, :limit => 8

      t.timestamps
    end
  end
end
