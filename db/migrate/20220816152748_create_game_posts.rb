class CreateGamePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :game_posts do |t|
      t.belongs_to :user, null: false
      # ^^ this hsould be required
      # belongs_to should almost ALWAYS be required
      t.string :game_title, null:false
      t.integer :requested_number_of_players, null:false
      t.text :description

      t.timestamps null:false
    end
  end
end
