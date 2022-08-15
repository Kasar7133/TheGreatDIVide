class CreateTeamsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :teams_users do |t|
      t.belongs_to :users 
      t.belongs_to :teams 


      t.timestamps null:false
    end
  end
end
