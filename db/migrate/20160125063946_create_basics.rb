class CreateBasics < ActiveRecord::Migration
  def change
    create_table :basics do |t|
      t.string :full_name
      t.string :email
      t.integer :phone
      t.string :linkedin
      t.string :essential

      t.timestamps null: false
    end
  end
end
