class UsController < ApplicationController
 # layout "shortener"
  # GET /us
  # GET /us.json
  def index
    @us = U.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @us }
    end
  end

  # GET /us/1
  # GET /us/1.json
  def show
    @u = U.find(params[:id])
    redirect_to @u.url
  end

  # GET /us/new
  # GET /us/new.json
  def new
    @u = U.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @u }
    end
  end

  # GET /us/1/edit
  def edit
    @u = U.find(params[:id])
    # @prefix = (@u.url.split '?').first + 'us/'
    @prefix = 'https://www.feewise.com/us/'
  end

  # POST /us
  # POST /us.json
  def create
    @u = U.new(params[:u])

    respond_to do |format|
      if @u.save
        format.html { redirect_to edit_u_path @u, notice: 'U was successfully created.' }
        # format.json { render json: @u, status: :created, location: @u }
      else
        format.html { render action: "new" }
        format.json { render json: @u.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /us/1
  # PUT /us/1.json
  def update
    @u = U.find(params[:id])

    respond_to do |format|
      if @u.update_attributes(params[:u])
        format.html { render action: "edit" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @u.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /us/1
  # DELETE /us/1.json
  def destroy
    @u = U.find_by_name(params[:id])
    @u.destroy

    respond_to do |format|
      format.html { redirect_to us_url }
      format.json { head :no_content }
    end
  end
end
