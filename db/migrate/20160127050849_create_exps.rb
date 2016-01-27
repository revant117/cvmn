class CreateExps < ActiveRecord::Migration
  def change
    create_table :exps do |t|
      t.string :comp_name
      t.string :comp_location
      t.string :role
      t.string :duration
      t.text :role_des
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
