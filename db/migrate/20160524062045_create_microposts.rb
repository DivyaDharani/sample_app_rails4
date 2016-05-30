class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id
      t.integer :num_likes,:default=>0 
      t.integer :num_unlikes,:default=>0
      t.timestamps
    end
  end
end
