class AddFiltersToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :sale_price, :decimal
    add_column :products, :is_on_sale, :boolean
  end
end
