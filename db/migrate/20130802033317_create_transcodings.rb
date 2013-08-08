class CreateTranscodings < ActiveRecord::Migration
  def change
    create_table :transcodings do |t|
      t.string :infile
      t.string :outfile
      t.string :format
      t.string :state
      t.hstore :properties

      t.timestamps
    end
  end
end
