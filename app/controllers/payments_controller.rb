class PaymentsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.find(params[:order_id])
    @publishable_key = "pk_test_51TJx2PQ1cAGe8FuCuGeok2ahmwj0ox4Agm3ZsXekUoifWnqFfYkIWlT8Xtn8Nj47TTusF7uuqdoYm04TurGJvTy900zzD1eyCc"
  end

  def create
    @order = Order.find(params[:order_id])
    stripe = Object.const_get('Stripe')

    begin
      charge = stripe::Charge.create(
        amount: (@order.total_price * 100).to_i,
        currency: "cad",
        source: params[:stripeToken],
        description: "Order ##{@order.id} - Red River Tech Store",
        metadata: {
          order_id: @order.id,
          customer_email: current_customer.email
        }
      )

      @order.update(
        status: "paid",
        stripe_payment_id: charge.id
      )

      flash[:notice] = "Payment successful! Order ##{@order.id} is now paid."
      redirect_to order_path(@order)

    rescue => e
      flash[:alert] = e.message
      redirect_to new_payment_path(order_id: @order.id)
    end
  end
end