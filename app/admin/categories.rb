ActiveAdmin.register Category do
  permit_params :name

  config.filters = false

  index do
    selectable_column
    id_column
    column :name
    column "Products Count" do |category|
      category.products.count
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :created_at
    end
  end
end