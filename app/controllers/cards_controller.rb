class CardsController < ApplicationController
#  layout "stripe"

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cards }
    end
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @card = Card.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.json
  def new

    @card = Card.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/1/edit
  def edit

    @card = Card.find(params[:id])
  end

  # POST /cards
  # POST /cards.json
  def create

    @card = Card.new(params[:card])
    @card.user = current_user
    discount_code = params[:card][:discount_code]
#debugger
    begin
      if !discount_code.blank?
        discount_code = DiscountCode.find_by_code discount_code
        if (discount_code.blank? || Date.today > discount_code.expiration)
          flash[:notice] = discount_code.blank? ? 'Not a valid Discount Code' : 'Expired Discount Code.'
          render :new and return
        end
      end

# May be messing things up
      # if !@card.valid?
      #   flash[:error] = 'Please fill out all required fields'
      #   redirect_to :new and return 
      # end

      discount_code = DiscountCode.find_by_code "REGULAR_PRICE" if discount_code.blank?
      if @card.save_with_payment(discount_code)
        # redirect_to @card, notice: 'Charge was successfully created.'
        session[:feewise_inproc_buying] = nil # finish purchase => not in the process of buying any more
        redirect_to '/thank_you', notice: 'Sucessfully made payment'
      else
        # All the error conditions go here
        logger.error "cards_controller::create => check for billing error with #{current_user.full_name} #{current_user.email}"
        # redirect_to '/thank_you', notice: 'There may have been a problem with this payment, we have been notified'
        render :new
      end
    rescue Exception => e
      @card.stripe_card_token = nil
      @card.save!
      logger.error "cards_controller::create => exception #{e.class.name} : #{e.message}"
      flash[:error] = "There was an issue with the card: #{e.message} Please try another."
      # ExceptionNotifier.deliver_exception_notification(e, self, request)
      render :new
    end
  end


  # PUT /cards/1
  # PUT /cards/1.json
  def update
    @card = Card.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { head :no_content }
    end
  end

end
