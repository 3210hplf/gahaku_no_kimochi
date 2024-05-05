class CreateChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :choices do |t|
      t.integer :question_id, null: false
      t.string :answer, null: false
      t.boolean :correct_answer, null: false
      t.timestamps
    end
    add_foreign_key :choices, :questions, column: :question_id
  end
end
