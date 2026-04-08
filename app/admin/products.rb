ActiveAdmin.register Product do
permit_params :name, :description, :price, :stock_quantity, :category_id, :image, :sale_price, :is_on_sale

  config.filters = false

  index do
    selectable_column
    id_column
    column :image do |product|
      if product.image.attached?
        image_tag product.image, height: 50
      end
    end
    column :name
    column :price
    column :stock_quantity
    column :category
    actions
  end

 form html: { multipart: true } do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :category
      f.input :is_on_sale, label: "On Sale?"
      f.input :sale_price, label: "Sale Price"
      f.input :image, as: :file, input_html: { accept: "image/*" }
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :stock_quantity
      row :category
      row :image do |product|
        if product.image.attached?
          image_tag product.image, height: 200
        else
          "No image uploaded"
        end
      end
    end
  end
end
ActiveAdmin.register Product do
controller do
  def update
    resource.image.purge if params[:product][:image].present? && resource.image.attached?
    super
  end
end
end