class CreateMaleWolves < ActiveRecord::Migration[7.0]
  def change
    create_table :male_wolves do |t|

      t.timestamps
    end
  end
end
