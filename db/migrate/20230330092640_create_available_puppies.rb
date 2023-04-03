class CreateAvailablePuppies < ActiveRecord::Migration[7.0]
  def change
    create_table :available_puppies do |t|
      t.string :foundation_wolves

      t.string :name
      t.string :restaurant_name
      t.string :menu_description

      t.timestamps
    end
  end
end
