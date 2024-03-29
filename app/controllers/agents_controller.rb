class AgentsController < ApplicationController
  # GET /agents
  # GET /agents.json
  def index
    @agents = Agent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agents }
    end
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
    @agent = Agent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agent }
    end
  end

  # GET /agents/new
  # GET /agents/new.json
  def new
    @agent = Agent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agent }
    end
  end

  # GET /agents/1/edit
  def edit
    @agent = Agent.find(params[:id])
  end

  # POST /agents
  # POST /agents.json
  def create
    @agent = Agent.new(params[:agent])

    respond_to do |format|
      if @agent.save
        format.html { redirect_to @agent, notice: 'Agent was successfully created.' }
        format.json { render json: @agent, status: :created, location: @agent }
      else
        format.html { render action: "new" }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agents/1
  # PUT /agents/1.json
  def update
    @agent = Agent.find(params[:id])

    respond_to do |format|
      if @agent.update_attributes(params[:agent])
        format.html { redirect_to @agent, notice: 'Agent was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.json
  def destroy
    @agent = Agent.find(params[:id])
    @agent.destroy

    respond_to do |format|
      format.html { redirect_to agents_url }
      format.json { head :ok }
    end
  end
  def setout
    
    @empty_array=[]
    @visitor_name=params[:visitors][:name]
    @visitor_id=params[:visitors][:identification]
    @agent=Agent.find(params[:id])
    
    @res=Visitor.where("name=:name AND identification=:ids",{:name=>@visitor_name,:ids=>@visitor_id})
    if(@res!=@empty_array)
      @visitor=@res[0]
      @records=Record.where("visitor_id=:visid AND residential_id=:resid",{:visid=>@visitor.id,:resid=>@agent.residential.id})
      @record=@records[0]
      
      Record.update(@record.id,:exit=>DateTime.now)
      @result=4
    else
      @result=5
    end
    
    
    respond_to do |format|
      format.html 
      format.js
    end
  
  end
  
  def setrecord
    @empty_array=[]
    @visitor_name=params[:visitor][:name]
    @visitor_id=params[:visitor][:identification]
    @record_entrance=DateTime.now
    @record_plate_number=params[:record][:plate_number]
    @user_address=params[:user][:address]
    @agent=Agent.find(params[:id])
    #see if the address exists
    @user=User.where("address=:address AND residential_id=:res",{:address=>@user_address,:res=>@agent.residential.id})
    print "***********************************************"
    print "************************************************"
    if @user!=@empty_array
      #see if the visitor is in the db with name and id
      if((@vis=Visitor.where("name=:name AND identification=:ids",{:name=>@visitor_name,:ids=>@visitor_id}))!=@empty_array)
        #if the visitor is in the db, see if he is not banned by the residential
        if((@banned=ResidentialBannedList.where("residential_id=:resid AND visitor_id=:visid",{:resid=>@agent.residential.id,:visid=>@vis[0].id}))==@empty_array)
          #se if the visitor isn't banned by the user
          if((@banned=UserBannedList.where("user_id=:usrid AND visitor_id=:visid",{:usrid=>@user[0].id,:visid=>@vis[0].id}))==@empty_array)
            #The visitor is able to enter
            @record=Record.new(:entrance=>@record_entrance,:visitor_id=>@vis[0].id,:residential_id=>@agent.residential.id,:plate_number=>@record_plate_number)
            @user[0].records<<@record
            @result=3
          else
            #the visitor is banned by the user
            @result=2
          end
        else
          #the visitor is banned by the residential
          @result=1
        end
      else
        #see if the user is name-banned by the user
        @result=3
        @user[0].banned_visitors.each do |b|
          if b.name==@visitor_name
            #the visitor's name is in the user's banned visitors list
            @result=2
            break
          end
        end
        #the visitor isn't in the user's banned visitors list
        if @result!=2
          @vis=Visitor.create(:name=>@visitor_name,:identification=>@visitor_id,:idpictureurl=>"http://notyetimplemented.com/picture.jpeg",:visitor_status_id=>1)
          @record=Record.new(:entrance=>@record_entrance,:visitor_id=>@vis.id,:residential_id=>@agent.residential.id,:plate_number=>@record_plate_number)
          @user[0].records<<@record
        end
      end
    else
      #the address does not exists in this residential
      @result=0
    end

    respond_to do |format|
      format.html 
      format.js
    end
  end
end
