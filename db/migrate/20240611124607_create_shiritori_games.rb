class CreateShiritoriGames < ActiveRecord::Migration[7.1]
  def change
    create_table :shiritori_games do |t|
      t.string :game_title,       null: false
      t.integer :status,          default: 0, null: false
      
      t.timestamps
    end
  end
end
