class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.belongs_to :user, null:false
      t.belongs_to :game_post, null:false

      t.timestamps null: false
    end
  end
end
