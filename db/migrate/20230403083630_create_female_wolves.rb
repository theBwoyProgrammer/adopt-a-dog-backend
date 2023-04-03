class CreateFemaleWolves < ActiveRecord::Migration[7.0]
  def change
    create_table :female_wolves do |t|
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
      # wolf percentage as int
      t.integer :wolf_percentage

      t.timestamps
    end
  end
end
