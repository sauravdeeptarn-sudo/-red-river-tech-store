class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders.includes(:order_items).order(created_at: :desc)
  end

  def new
    @cart = session[:cart] || {}
    if @cart.empty?
      flash[:alert] = "Your cart is empty!"
      redirect_to root_path and return
    end

    @cart_items = []
    @subtotal = 0

    @cart.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      if product
        subtotal = product.price * quantity
        @subtotal += subtotal
        @cart_items << { product: product, quantity: quantity, subtotal: subtotal }
      end
    end

    @provinces = Province.all.order(:name)
    @customer = current_customer
  end

  def create
    @cart = session[:cart] || {}

    if @cart.empty?
      flash[:alert] = "Your cart is empty!"
      redirect_to root_path and return
    end

    province = Province.find(params[:province_id])

    subtotal = 0
    @cart.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      subtotal += product.price * quantity if product
    end

    gst_amount = (subtotal * province.gst).round(2)
    pst_amount = (subtotal * province.pst).round(2)
    hst_amount = (subtotal * province.hst).round(2)
    total = subtotal + gst_amount + pst_amount + hst_amount

    order = Order.new(
      customer: current_customer,
      total_price: total,
      subtotal: subtotal,
      gst_amount: gst_amount,
      pst_amount: pst_amount,
      hst_amount: hst_amount,
      province_id: province.id,
      status: "pending"
    )

    if order.save
      @cart.each do |product_id, quantity|
        product = Product.find_by(id: product_id)
        if product
          order.order_items.create!(
            product: product,
            quantity: quantity,
            price_at_purchase: product.price
          )
        end
      end

      current_customer.update(
        address: params[:address],
        province: province
      )

      session[:cart] = {}
      flash[:notice] = "Order placed successfully!"
      redirect_to order_path(order)
    else
      flash[:alert] = "Error placing order!"
      redirect_to new_order_path
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.includes(:product)
    @province = Province.find_by(id: @order.province_id)
  end
end