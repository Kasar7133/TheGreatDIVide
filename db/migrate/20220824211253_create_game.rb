class CreateGame < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title, null: false, unique: true


      t.timestamps null:false
    end
  end
end
