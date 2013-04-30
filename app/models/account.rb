class Account < ActiveRecord::Base
  # attr_accessible :title, :body

    # t.string   "when_paid" # TODO: not used => remove
    # t.integer  "amount_paid" # TODO: not used => remove

  belongs_to :user, :class_name => "User", :foreign_key => "user_id"

  # 1. Register with feeWISE?
  def register_with_feewise?
    "DONE"
  end

  # 1.5 Add partners
  def add_people?
    return "DONE" if ((register_with_feewise? == "DONE") && (!user.partners.blank? || !ignore_partners.blank?)) 
    return "INPROC" if ((register_with_feewise? == "DONE") && ((user.partners.blank?) && ignore_partners.blank?))
    return nil
  end

  # 2. Set Budget?
  def set_budget?
#debugger
    return "DONE" if (user.paid? && ((!user.purchase_preference.purchase_low.blank?) && (!user.purchase_preference.purchase_high.blank?)))
    return "INPROC" if add_people? == "DONE"
    return nil
  end

  # 3. Build your Team?
  def build_your_team?
    return "DONE" if (set_budget? == "DONE") && (user.team.has_leadplace_agent?) 
    return "INPROC" if (set_budget? == "DONE") && (!user.team.has_leadplace_agent?)
    return nil
  end

  # 4. Find a Home?
  def find_a_home?
    return "INPROC" if build_your_team? == "DONE"
    nil
  end

  # 5. Negotiate Best Deal?
  def negotiate_best_deal?
        nil
  end

  # 6. Sign a Contract?
  def sign_a_contract?
    nil
  end

  # 7. Complete Property Checkups?
  def complete_property_checkups?
    nil
  end

  # 8. Prepare Closing?
  def prepare_closing?
        nil
  end

  # 9. Close?
  def close?
        nil
  end

  # 10 Request Rebate?.
  def request_rebate?
        nil
  end

  # 11 Move In and Celebrate?.
  def move_in_and_celebrate?
       nil
  end

end
