class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html 
        format.js
      else
        format.html 
        format.js
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  def addbanned
    @emptyarray=[]
    @user=User.find(params[:id])
    if (@vis=Visitor.where("name=:visitor_name",{:visitor_name=>params[:visitor][:name]})) != @emptyarray
      @viss=@vis[0]
      @user.banned_visitors<<@viss
    else
      @viss=Visitor.new(:name=>params[:visitor][:name],:visitor_status_id=>1)
      @viss.save
      @user.banned_visitors<<@viss
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def supbanned
    @emptyarray=[]
    
    @entry=UserBannedList.where("user_id = :userid AND visitor_id = :visitorid",{:userid=>params[:user_id],:visitorid=>params[:visitor_id]})
    if @entry!=@emptyarray
      @item=params[:visitor_id]
      UserBannedList.destroy(@entry[0])
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def search
    @emptyarray=[]
    @begindate=params[:begin]
    print "******************************************************"
    @start_date = DateTime.civil(params[:record][:"begin(1i)"].to_i,params[:record][:"begin(2i)"].to_i,params[:record][:"begin(3i)"].to_i,params[:record][:"begin(4i)"].to_i,params[:record][:"begin(5i)"].to_i)
    @end_date = DateTime.civil(params[:record][:"end(1i)"].to_i,params[:record][:"end(2i)"].to_i,params[:record][:"end(3i)"].to_i,params[:record][:"end(4i)"].to_i,params[:record][:"end(5i)"].to_i)

    @records=Record.where("user_id=:id AND entrance>=:start AND entrance<=:end ",{:start=>@start_date,:end=>@end_date,:id=>params[:id]}).order("entrance DESC")

    respond_to do |format|
      format.html
      format.js
    end
  end
  def searchplate
    @records=Record.where("user_id=:id AND plate_number=:number",{:id=>params[:id],:number=>params[:record][:plate_number]})
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  def searchname
#     @records=Record.where("user_id=:id AND name=:number",{:id=>params[:id],:number=>params[:record][:name]})
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def searchdoc
#     @records=Record.where("user_id=:id AND plate_number=:number",{:id=>params[:id],:number=>params[:record][:identification]})
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
