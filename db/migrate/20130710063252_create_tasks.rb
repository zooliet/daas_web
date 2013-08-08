class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :category
      t.string :todo
      t.string :media
      t.string :state

      t.timestamps
    end
  end
end
