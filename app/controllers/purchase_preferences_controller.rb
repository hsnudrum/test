class PurchasePreferencesController < ApplicationController

  before_filter :authenticate_user!

  # GET /purchase_preferences
  # GET /purchase_preferences.json
  def index
    @purchase_preferences = PurchasePreference.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchase_preferences }
    end
  end

  # GET /purchase_preferences/1
  # GET /purchase_preferences/1.json
  def show

    # @purchase_preference = PurchasePreference.find(params[:id])
    @purchase_preference = current_user.purchase_preference if current_user.purchase_preference.present?

    @buying = session[:feewise_inproc_buying]
    redirect_to(new_purchase_preference_path) and return if current_user && @buying

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @purchase_preference }
    # end
  end

  # GET /purchase_preferences/new
  # GET /purchase_preferences/new.json
  def new
    @purchase_preference = PurchasePreference.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase_preference }
    end
  end

  # GET /purchase_preferences/1/edit
  def edit
    if current_user
      @buying = session[:feewise_inproc_buying]
      @purchase_preference = current_user.purchase_preference
    else
      redirect_to root_url
    end
  end

  # POST /purchase_preferences
  # POST /purchase_preferences.json
  def create
    @purchase_preference = PurchasePreference.new(params[:purchase_preference])

    if @purchase_preference.save
      redirect_to(new_card_path) if true # buying
    else
      render action: "new"
    end

    respond_to do |format|
      if @purchase_preference.save
        format.html { redirect_to @purchase_preference, notice: 'Purchase preference was successfully created.' }
        format.json { render json: @purchase_preference, status: :created, location: @purchase_preference }
      else
        format.html { render action: "new" }
        format.json { render json: @purchase_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /purchase_preferences/1
  # PUT /purchase_preferences/1.json
  def update

    @buying = session[:feewise_inproc_buying]
    @purchase_preference = current_user.purchase_preference
    if @purchase_preference.update_attributes(params[:purchase_preference])
      redirect_to PurchaseFlow.step_path(3) and return if @buying && current_user
      # otherwise falls through to show view
      # redirect_to eval("#{session[:feewise_steps][5]} @purchase_preference") and return if !@buying && current_user
      redirect_to account_path current_user.account
    else
      render action: "edit"
    end

    # if @buying && current_user
    #   if @purchase_preference.update_attributes(params[:purchase_preference])
    #     redir 3 # new card
    #   else

    #   end
    # else
    #   redir 5
    # end

    # @purchase_preference = current_user.purchase_preference
    # PurchasePreference.find(params[:id])

    # respond_to do |format|
    #   if @purchase_preference.update_attributes(params[:purchase_preference])
    #     format.html { redirect_to @purchase_preference, notice: 'Purchase preference was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @purchase_preference.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /purchase_preferences/1
  # DELETE /purchase_preferences/1.json
  def destroy
    @purchase_preference = PurchasePreference.find(params[:id])
    @purchase_preference.destroy

    respond_to do |format|
      format.html { redirect_to purchase_preferences_url }
      format.json { head :no_content }
    end
  end
end
