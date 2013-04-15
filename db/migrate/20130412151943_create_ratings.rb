class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.string :type
      t.integer :type_id
      t.references :user

      t.timestamps
    end
    add_index :ratings, :user_id
  end
end
