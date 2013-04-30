class StaticPagesController < ApplicationController

  before_filter :not_in_procee_of_buying, :except => [:terms_of_use, :privacy_policy, :index]

  # before_filter :allocate_subscription_for_emails

  # GET /static_pages
  # GET /static_pages.json
  def index

    session[:style] = nil if params.values.find_index "clear"
    @static_pages = []# StaticPage.all
     #?? wtf is this?

    @video = '8Cx875BeRPI'

    if session[:feewise_inproc_buying] && current_user # logged in
      @purchase_preference = current_user.purchase_preference ? current_user.purchase_preference : PurchasePreference.new
      # redirect_to eval("#{session[:feewise_steps][2]} @purchase_preference") and return
      # redirect_to eval(PurchaseFlow.step_path(2, @purchase_preference)) and return
      redirect_to PurchaseFlow.step_path(2, @purchase_preference) and return
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @static_pages }
    end
  end

  # GET /static_pages/1
  # GET /static_pages/1.json
  # def show
  #   @static_page = StaticPage.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @static_page }
  #   end
  # end

  # GET /static_pages/new
  # GET /static_pages/new.json
  def new
    @static_page = StaticPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @static_page }
    end
  end

  # GET /static_pages/1/edit
  def edit
    @static_page = StaticPage.find(params[:id])
  end

  # POST /static_pages
  # POST /static_pages.json
  def create
    @static_page = StaticPage.new(params[:static_page])

    respond_to do |format|
      if @static_page.save
        format.html { redirect_to @static_page, notice: 'Static page was successfully created.' }
        format.json { render json: @static_page, status: :created, location: @static_page }
      else
        format.html { render action: "new" }
        format.json { render json: @static_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /static_pages/1
  # PUT /static_pages/1.json
  def update
    @static_page = StaticPage.find(params[:id])

    respond_to do |format|
      if @static_page.update_attributes(params[:static_page])
        format.html { redirect_to @static_page, notice: 'Static page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @static_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /static_pages/1
  # DELETE /static_pages/1.json
  def destroy
    @static_page = StaticPage.find(params[:id])
    @static_page.destroy

    respond_to do |format|
      format.html { redirect_to static_pages_url }
      format.json { head :no_content }
    end
  end

  def why_feewise
  end

  def terms_of_use
  end

  def support
  end

  def sign_up
    redirect_to(new_user_registration_path)
  end

  def sign_in
    redirect_to(new_user_session_path)
  end

  def forgot
    redirect_to(new_password_path(:user))
  end

  def purchase
  end

  def privacy_policy
  end

  def partners
  end

  def investors
  end

  def how_it_works
  end

  def careers
  end

  def about_us
  end

  def thank_you
  end

  def team
  end

  def home_a
  end

  # def run_restart
  # end

  # def do_the_restart
  #   puts "Graceful Volume Squared Shutdown"
  #   exit
  #   # begin
  #   #   `run heroku restart`
  #   # rescue Exception => e
  #   # end
  # end

# def F123
#     redirect_to 'https://www.feewise.com/?utm_source=charles_test&utm_medium=campaign_business_card_test&utm_campaign=campaign_test'
#   # redirect_to 'http://www.web.com/myurl', :overwrite_params => { :parm => 'foo' }
# end

  private

  def not_in_procee_of_buying
    session[:feewise_inproc_buying] = false
  end

  # def allocate_subscription_for_emails
  #   @subscription = Subscription.new
  # end

end
