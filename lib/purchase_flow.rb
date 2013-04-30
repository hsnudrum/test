#class Wizard::PathGenerator
#class Rightpeopleforthejob::PurchaseFlow
class PurchaseFlow

#  Moved to feewise/config/application.rb
  @@wizard_steps = %w[new_account_path new_user_registration_path edit_purchase_preference_path new_card_path thank_you_path accounts_path]

  def self.step_path(step,args=nil)
    Rails.application.routes.url_helpers.send(@@wizard_steps[step],args)
  end

end

# in your controller

# next_step = PurchaseFlow.step_path(1)
