class AdminsController < ApplicationController
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admins }
    end
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/new
  # GET /admins/new.json
  def new
    @admin = Admin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/1/edit
  def edit
    @admin = Admin.find(params[:id])
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(params[:admin])

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render json: @admin, status: :created, location: @admin }
      else
        format.html { render action: "new" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admins/1
  # PUT /admins/1.json
  def update
    @admin = Admin.find(params[:id])

    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :ok }
    end
  end
  def supuser
    @user=User.find(params[:usr_id])
    @residential=Admin.find(params[:id])
    User.delete(@user.id)
    respond_to do |format|
      format.html 
      format.js
    end
  end
  def searchdate
    @emptyarray=[]
    @admin=Admin.find(params[:id])
    @start_date = DateTime.civil(params[:record][:"begin(1i)"].to_i,params[:record][:"begin(2i)"].to_i,params[:record][:"begin(3i)"].to_i,params[:record][:"begin(4i)"].to_i,params[:record][:"begin(5i)"].to_i)
    @end_date = DateTime.civil(params[:record][:"end(1i)"].to_i,params[:record][:"end(2i)"].to_i,params[:record][:"end(3i)"].to_i,params[:record][:"end(4i)"].to_i,params[:record][:"end(5i)"].to_i)

    @records=Record.where("residential_id=:id AND entrance>=:start AND entrance<=:end ",{:start=>@start_date,:end=>@end_date,:id=>@admin.residential}).order("entrance DESC")

    respond_to do |format|
      format.html 
      format.js
    end
  end
  def searchplate
    @admin=Admin.find(params[:id])
    @records=Record.where("residential_id=:id AND plate_number=:number",{:id=>@admin.residential.id,:number=>params[:record][:plate_number]})
    respond_to do |format|
      format.html 
      format.js
    end
  end
  def delbanned
    @emptyarray=[]
    
    @entry=ResidentialBannedList.where("residential_id = :resid AND visitor_id = :visitorid",{:resid=>params[:residential_id],:visitorid=>params[:visitor_id]})
    if @entry!=@emptyarray
      @item=params[:visitor_id]
      ResidentialBannedList.destroy(@entry[0])
    end
    
    respond_to do |format|
      format.html 
      format.js
    end
  end
  def addresbanned
    @admin=Admin.find(params[:id])
    @viss=Visitor.new(:name=>params[:visitor][:name],:visitor_status_id=>1,:identification=>params[:visitor][:identification])
    @viss.save
    @admin.residential.banned_visitors<<@viss
    respond_to do |format|
      format.html 
      format.js
    end
  end
end
