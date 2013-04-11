class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.text :description
      t.integer :rating
      t.references :user
      t.references :topic

      t.timestamps
    end
  end
end
