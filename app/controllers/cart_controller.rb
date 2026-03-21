class CartController < ApplicationController
  def show
    @cart = session[:cart] || {}
    @cart_items = []
    @total = 0

    @cart.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      if product
        subtotal = product.price * quantity
        @total += subtotal
        @cart_items << { product: product, quantity: quantity, subtotal: subtotal }
      end
    end
  end

  def add
    session[:cart] ||= {}
    product_id = params[:id].to_s
    session[:cart][product_id] = (session[:cart][product_id] || 0) + 1
    flash[:notice] = "Product added to cart!"
    redirect_back fallback_location: root_path
  end

  def update
    session[:cart] ||= {}
    product_id = params[:id].to_s
    quantity = params[:quantity].to_i

    if quantity > 0
      session[:cart][product_id] = quantity
    else
      session[:cart].delete(product_id)
    end

    flash[:notice] = "Cart updated!"
    redirect_to cart_path
  end

  def remove
    session[:cart] ||= {}
    session[:cart].delete(params[:id].to_s)
    flash[:notice] = "Item removed from cart!"
    redirect_to cart_path
  end
end