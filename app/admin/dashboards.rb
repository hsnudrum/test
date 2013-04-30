ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.

  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end


  section "Customers within last day" do
    ul do
      (User.where("created_at > ?", Time.now - 1.day)).collect do |user|
        li link_to(user.email, admin_user_path(user))
      end
    end
  end

  section "List of Discount Codes" do
    ul do
      (DiscountCode.all).collect do |dc|
        li "#{dc.code} | #{dc.price} | #{dc.expiration}"
      end
    end
  end


  section "Note" do
    div do
      'Most of the Content of interest is currently under'
    end
    div do
      'the Cards menu item as seen above'
    end
  end


  section "Recent emails" do
    subsections =
      [{ title: 'from Credit Cards',
         klass: Card,
         link_path_method: :admin_card_path},
       { title: 'from Contact feeWise',
         klass: ContactFeewise,
         link_path_method: :admin_contact_feewise_path },
       { title: 'from subscription requests',
         klass: Subscription,
         link_path_method: :admin_subscription_path },
       { title: 'from user list',
         klass: User,
         link_path_method: :admin_user_path }]

    subsections.each do |subsection|
      div do
         h6 subsection[:title]
         ul do
           subsection[:klass].order('created_at DESC').limit(10).each do |entry|
             li link_to(entry.email.blank? ? "anonymous" : entry.email,
                        Rails.application.routes.url_helpers.send(
                          subsection[:link_path_method],
                          entry)) +
               " - #{entry.created_at.localtime.strftime('%l:%M%P %m/%d/%Y')}"
          end
        end
      end
    end
  end

  # AdminUser.create!(:email => 'admin@leadplace.com', :password => 'password', :password_confirmation => 'password')



  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end

  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
