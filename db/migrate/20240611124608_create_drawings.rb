class CreateDrawings < ActiveRecord::Migration[7.1]
  def change
    create_table :drawings do |t|
      t.integer :user_id,            null: false
      t.integer :shiritori_game_id, null: false
      t.string :artwork,             null: false
      t.string :title,               null: false, limit: 15
      t.integer :turn_count,         default: 0, null: false
      
      t.timestamps
    end
    add_foreign_key :drawings, :users, column: :user_id
    add_foreign_key :drawings, :shiritori_games, column: :shiritori_game_id
  end
end
