class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :proj_name
      t.text :proj_des
      t.string :proj_add
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
