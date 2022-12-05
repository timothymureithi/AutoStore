class AddActiveListingToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :active_listing, :boolean
  end
end
