class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :image, null: false
      t.string :author, null: false
      t.string :age, null: false
      t.timestamps
    end
  end
end
