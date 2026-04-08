class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all.includes(:category, image_attachment: :blob)

    if params[:search].present?
      @products = @products.where("name ILIKE ? OR description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:category_id].present? && params[:category_id] != "0"
      @products = @products.where(category_id: params[:category_id])
    end

    if params[:filter].present?
      case params[:filter]
      when "on_sale"
        @products = @products.on_sale
      when "new"
        @products = @products.new_arrivals
      when "recently_updated"
        @products = @products.recently_updated
      end
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end