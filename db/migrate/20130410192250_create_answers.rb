class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.integer :rating
      t.text :description
      t.references :user
      t.references :question

      t.timestamps
    end
  end
end
