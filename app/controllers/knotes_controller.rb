class KnotesController < ApplicationController
  # GET /knotes
  # GET /knotes.xml
  def index
    @knotes = Knote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @knotes }
    end
  end

  # GET /knotes/1
  # GET /knotes/1.xml
  def show
    @knote = Knote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @knote }
    end
  end

  # GET /knotes/new
  # GET /knotes/new.xml
  def new
    @knote = Knote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @knote }
    end
  end

  # GET /knotes/1/edit
  def edit
    @knote = Knote.find(params[:id])
  end

  # POST /knotes
  # POST /knotes.xml
  def create
    @knote = Knote.new(params[:knote])

    respond_to do |format|
      if @knote.save
        format.html { redirect_to(@knote, :notice => 'Knote was successfully created.') }
        format.xml  { render :xml => @knote, :status => :created, :location => @knote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @knote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /knotes/1
  # PUT /knotes/1.xml
  def update
    @knote = Knote.find(params[:id])

    respond_to do |format|
      if @knote.update_attributes(params[:knote])
        format.html { redirect_to(@knote, :notice => 'Knote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @knote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /knotes/1
  # DELETE /knotes/1.xml
  def destroy
    @knote = Knote.find(params[:id])
    @knote.destroy

    respond_to do |format|
      format.html { redirect_to(knotes_url) }
      format.xml  { head :ok }
    end
  end
end
