class CreateShiritoriGames < ActiveRecord::Migration[7.1]
  def change
    create_table :shiritori_games do |t|
      t.integer :user_id,         null: false
      t.string :game_title,       null: false
      t.integer :status,          default: 0, null: false
      
      t.timestamps
    end
    add_foreign_key :shiritori_games, :users, column: :user_id
  end
end
