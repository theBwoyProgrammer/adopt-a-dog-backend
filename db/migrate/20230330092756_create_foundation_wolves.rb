class CreateFoundationWolves < ActiveRecord::Migration[7.0]
  def change
    create_table :foundation_wolves do |t|

      t.timestamps
    end
  end
end
