class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|      
      t.integer :player_count, null:false


      t.timestamps null:false
    end
  end
end
