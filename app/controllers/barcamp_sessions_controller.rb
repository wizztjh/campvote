class BarcampSessionsController < ApplicationController
  # GET /barcamp_sessions
  # GET /barcamp_sessions.xml
  before_filter :update
  before_filter :authenticate_user! , :except => :index
  def index
    @barcamp_sessions = BarcampSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @barcamp_sessions }
    end
  end

  # GET /barcamp_sessions/1
  # GET /barcamp_sessions/1.xml
  def show
    @barcamp_session = BarcampSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @barcamp_session }
    end
  end

  # GET /barcamp_sessions/new
  # GET /barcamp_sessions/new.xml
  def new
    @barcamp_session = BarcampSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @barcamp_session }
    end
  end

  # GET /barcamp_sessions/1/edit
  def edit
    @barcamp_session = BarcampSession.find(params[:id])
  end

  # POST /barcamp_sessions
  # POST /barcamp_sessions.xml
  def create
    @barcamp_session = BarcampSession.new(params[:barcamp_session])

    respond_to do |format|
      if @barcamp_session.save
        format.html { redirect_to(@barcamp_session, :notice => 'Barcamp session was successfully created.') }
        format.xml  { render :xml => @barcamp_session, :status => :created, :location => @barcamp_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @barcamp_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /barcamp_sessions/1
  # PUT /barcamp_sessions/1.xml
  def update
    @barcamp_session = BarcampSession.find(params[:id])

    respond_to do |format|
      if @barcamp_session.update_attributes(params[:barcamp_session])
        format.html { redirect_to(@barcamp_session, :notice => 'Barcamp session was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @barcamp_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /barcamp_sessions/1
  # DELETE /barcamp_sessions/1.xml
  def destroy
    @barcamp_session = BarcampSession.find(params[:id])
    @barcamp_session.destroy

    respond_to do |format|
      format.html { redirect_to(barcamp_sessions_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def update
    BarcampSession.update_twitter!
  end
end
