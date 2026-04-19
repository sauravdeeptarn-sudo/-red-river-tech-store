class ProductsController < ApplicationController
  def index
    @categories = Category.all

    with_images = Product.joins(:image_attachment).includes(:category, image_attachment: :blob)
    without_images = Product.where.not(id: with_images.pluck(:id)).includes(:category)
    all_products = with_images + without_images

    if params[:search].present?
      all_products = all_products.select { |p| p.name.downcase.include?(params[:search].downcase) || p.description.downcase.include?(params[:search].downcase) }
    end

    if params[:category_id].present? && params[:category_id] != "0"
      all_products = all_products.select { |p| p.category_id == params[:category_id].to_i }
    end

    if params[:filter].present?
      case params[:filter]
      when "on_sale"
        all_products = all_products.select { |p| p.is_on_sale }
      when "new"
        all_products = all_products.select { |p| p.created_at >= 3.days.ago }
      when "recently_updated"
        all_products = all_products.select { |p| p.updated_at >= 3.days.ago && p.created_at < 3.days.ago }
      end
    end

    @products = Kaminari.paginate_array(all_products).page(params[:page]).per(6)
  end

  def show
    @product = Product.find(params[:id])
  end
end