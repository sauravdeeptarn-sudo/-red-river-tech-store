ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity, :category_id, :image

  config.filters = false

  index do
    selectable_column
    id_column
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
          image_tag rails_blob_path(product.image, disposition: "inline"), height: 200
        else
          "No image uploaded"
        end
      end
    end
  end

  controller do
    def permitted_params
      params.require(:product).permit(:name, :description, :price, :stock_quantity, :category_id, :image)
    end
  end
end