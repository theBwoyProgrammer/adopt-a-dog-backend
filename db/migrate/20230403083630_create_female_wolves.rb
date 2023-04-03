class CreateFemaleWolves < ActiveRecord::Migration[7.0]
  def change
    create_table :female_wolves do |t|

      t.timestamps
    end
  end
end
