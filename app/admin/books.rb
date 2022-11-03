ActiveAdmin.register Book do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :publisher_id, :title, :image, :isbndb, :publish_date, :language, :mrp, :discount, :price, :paperback,
                :quantity, :active

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs
    f.inputs do # builds an input field for every attribute
      f.input :image, as: :file
    end
    f.actions # adds the 'Submit' and 'Cancel' buttons
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:publisher_id, :title, :isbndb, :publish_date, :language, :mrp, :discount, :price, :paperback, :quantity, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
