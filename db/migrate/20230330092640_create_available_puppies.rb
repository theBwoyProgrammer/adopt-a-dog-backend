class CreateAvailablePuppies < ActiveRecord::Migration[7.0]
  def change
    create_table :available_puppies do |t|
      t.string :foundation_wolves

      t.timestamps
    end
  end
end
