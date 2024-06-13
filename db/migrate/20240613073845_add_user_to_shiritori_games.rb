class AddUserToShiritoriGames < ActiveRecord::Migration[7.1]
  def change
    add_column :shiritori_games, :user_id, :integer, null: false, default: 1
    add_foreign_key :shiritori_games, :users
  end
end
