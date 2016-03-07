class AddBidmaxToProducts < ActiveRecord::Migration
  def change
    add_column :products, :bidmax, :integer
  end
end
