class UserScore < ActiveRecord::Migration
  def up
    add_column :users, :score, :integer
  end

  def down
  end
end
