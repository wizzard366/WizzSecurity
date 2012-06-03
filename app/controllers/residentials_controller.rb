class ResidentialsController < ApplicationController
  # GET /residentials
  # GET /residentials.json
  def index
    @residentials = Residential.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @residentials }
    end
  end

  # GET /residentials/1
  # GET /residentials/1.json
  def show
    @residential = Residential.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @residential }
    end
  end

  # GET /residentials/new
  # GET /residentials/new.json
  def new
    @residential = Residential.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @residential }
    end
  end

  # GET /residentials/1/edit
  def edit
    @residential = Residential.find(params[:id])
  end

  # POST /residentials
  # POST /residentials.json
  def create
    @residential = Residential.new(params[:residential])

    respond_to do |format|
      if @residential.save
        format.html { redirect_to @residential, notice: 'Residential was successfully created.' }
        format.json { render json: @residential, status: :created, location: @residential }
      else
        format.html { render action: "new" }
        format.json { render json: @residential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /residentials/1
  # PUT /residentials/1.json
  def update
    @residential = Residential.find(params[:id])

    respond_to do |format|
      if @residential.update_attributes(params[:residential])
        format.html { redirect_to @residential, notice: 'Residential was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @residential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residentials/1
  # DELETE /residentials/1.json
  def destroy
    @residential = Residential.find(params[:id])
    @residential.destroy

    respond_to do |format|
      format.html { redirect_to residentials_url }
      format.json { head :ok }
    end
  end
end
