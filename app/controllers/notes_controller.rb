class NotesController < ApplicationController
# GET /notes
  def index
    @title = "Notes"
    @notes = Note.find(:all)
  end
  
  # GET /notes/1
  def show
    @note = Note.find(params[:id])
  end
  
  # GET /notes/new
  def new
    @note = Note.new
  end
  
  # POST /notes
  def create
    @note = Note.new(params[:note])
    if @note.save
      flash[:notice] = "Successfully created note."
      redirect_to @note  # NOTE -- Should redirect to 'show' view
    else
      render :action => 'new'
    end
  end
  
  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end
  
  # PUT /notes/1
  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(params[:note])
      flash[:notice] = "Successfully updated note."
      redirect_to @note
    else
      render :action => 'edit'
    end
  end
  
  # DELETE /notes/1
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    flash[:notice] = "Successfully destroyed note."
    redirect_to notes_url
  end
end
