class AddQualityAndScaleToTranscodings < ActiveRecord::Migration
  def change
    add_column :transcodings, :quality, :string
    add_column :transcodings, :scale, :string
  end
end
