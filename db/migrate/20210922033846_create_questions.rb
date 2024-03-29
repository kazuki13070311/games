class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body
      t.integer :best_answer_id, default: nil
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
