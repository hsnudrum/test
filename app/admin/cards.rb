ActiveAdmin.register Card do

  index do
    column :email do |c|
      c.user.email if c.user && c.user.email
    end
    column :phone  do |c|
      c.user.purchase_preference.daytime_phone if c.user && c.user.purchase_preference && c.user.purchase_preference.daytime_phone
    end
    # tokenid
    column :paid
    column 'Start Date', :created_at
    column :name do |c|
      c.user.full_name if c.user && c.user.full_name
    end
    column 'Address', :billing_address
    column :city
    column :state
    # zip
    column 'Paid', :amount_paid do |c|
      c.amount_paid.to_i / 100 if c && c.amount_paid
    end
    column 'Coupon', :discount_code

    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :email
      # f.input :# published_at, :label => "Publish Post At"
      f.input :paid
      f.input :bliggino, :as => :hidden
    end
    f.inputs "Content" do
      f.input :city
    end
    f.buttons
  end



end
