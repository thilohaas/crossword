class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :ratings, :type, :rating_type
  end

  def down
  end
end
