class AddPriceMinimumMiniBidImmediatePriceBidderIdBiddingDateEndToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price_minimum, :integer
    add_column :products, :mini_bid, :integer
    add_column :products, :immediate_price, :integer
    add_column :products, :bidder_id, :integer
    add_column :products, :bidding_date_end, :datetime

  end
end
