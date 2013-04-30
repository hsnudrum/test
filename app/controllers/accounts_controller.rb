class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])    

    # if current_user && current_user.email.present? && current_user.email.ends_with?('_admin@leadplace.com')
    #   current_user.update_attribute :admin, true
    # end

    @buying = session[:feewise_inproc_buying]
    @purchase_preference = current_user.purchase_preference if !current_user.blank?

    begin
      # Rails.env.production? || Rails.env.staging? do
####      logger.warn "Sending email to: #{current_user.email} subject: #{current_user.full_name} has signed up"
####      UserMailer.welcome_email(current_user).deliver if current_user
      # end
    rescue Exception => e
      note = "Attempted to notify feewise that there is a paying customer but email failed for #{current_user.full_name} #{current_user.email}"
      logger.error note
      Bulletin.create! :body => note, :kind => 'error'
      errors.add :base, "There was a problem notifying Feewise of your request. Your request will be resent until it is acknowledged.  Thank you!  Feel free to contact us by phone.  We want you to have the most timely service "
    end
    redirect_to PurchaseFlow.step_path(2, @purchase_preference) and return if @buying && current_user

    if !@buying && current_user
      render :show and return
    else
      redirect_to admin_root_path
    end

  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new

    if current_user.blank?
      # No signed in user => use the session directly not with methods
      session[:feewise_inproc_buying] = true
      session[:feewise_current_step] = new_account_path  # not sure this is needed

      @user = User.new
      redirect_to PurchaseFlow.step_path(1) and return
    else
      @user = current_user
      @purchase_preference = @user.purchase_preference
      session[:feewise_inproc_buying] = true
      redirect_to PurchaseFlow.step_path(2, @purchase_preference) and return
    end

  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy

    @account = Account.find(params[:id])
    @account.user.destroy
    # redirect_to accounts_path
    # render :index
    # redirect_to '/'
    redirect_to accounts_url

    # respond_to do |format|
    #   format.html { redirect_to accounts_url }
    #   format.json { head :no_content }
    # end
  end


end
