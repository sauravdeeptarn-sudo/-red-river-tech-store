ActiveAdmin.register Page do
  permit_params :title, :content

  config.filters = false

  index do
    selectable_column
    id_column
    column :title
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :text, input_html: { rows: 10 }
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :content
    end
  end
end