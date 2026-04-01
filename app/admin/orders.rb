ActiveAdmin.register Order do
  config.filters = false
  actions :index, :show

  index do
    selectable_column
    id_column
    column :customer do |order|
      order.customer.email
    end
    column :customer_name do |order|
      order.customer.name
    end
    column "Products" do |order|
      order.order_items.includes(:product).map { |item|
        "#{item.product.name} x#{item.quantity}"
      }.join(", ")
    end
    column "Subtotal" do |order|
      number_to_currency(order.subtotal)
    end
    column "GST" do |order|
      number_to_currency(order.gst_amount)
    end
    column "PST" do |order|
      number_to_currency(order.pst_amount)
    end
    column "HST" do |order|
      number_to_currency(order.hst_amount)
    end
    column "Grand Total" do |order|
      number_to_currency(order.total_price)
    end
    column :status
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :customer do |order|
        "#{order.customer.name} (#{order.customer.email})"
      end
      row :status
      row :subtotal do |order|
        number_to_currency(order.subtotal)
      end
      row :gst_amount do |order|
        number_to_currency(order.gst_amount)
      end
      row :pst_amount do |order|
        number_to_currency(order.pst_amount)
      end
      row :hst_amount do |order|
        number_to_currency(order.hst_amount)
      end
      row :total_price do |order|
        number_to_currency(order.total_price)
      end
      row :created_at
    end

    panel "Order Items" do
      table_for order.order_items.includes(:product) do
        column :product do |item|
          item.product.name
        end
        column :quantity
        column "Price at Purchase" do |item|
          number_to_currency(item.price_at_purchase)
        end
        column "Subtotal" do |item|
          number_to_currency(item.price_at_purchase * item.quantity)
        end
      end
    end
  end
end