class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :degree
      t.string :year
      t.string :college

      t.timestamps null: false
    end
  end
end
