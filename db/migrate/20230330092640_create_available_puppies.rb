class CreateAvailablePuppies < ActiveRecord::Migration[7.0]
  def change
    create_table :available_puppies do |t|
      # name data type = str
      t.string :name
      # D.O.B data type = date
      t.date :date_of_birth
      # wolf picture data type = str
      t.string :picture
      # weight data type = float
      t.float :weight
      # description data type = str
      t.string :description
      # gender as str
      t.string :gender
      # wolf percentage as int
      t.integer :wolf_percentage
      # father and mother as str
      t.string :father
      t.string :mother
      # availability as a bool
      t.boolean :availability

      t.timestamps
    end
  end
end
