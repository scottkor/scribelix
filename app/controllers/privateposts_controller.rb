class PrivatepostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :edit, :update, :destroy]
  before_filter :authorized_user, :only => [:edit, :update, :destroy]
  
  def new
    if signed_in?
    @privatepost = Privatepost.new 
	@category_list = Category.find(:all)
	@reformatted_category_list = @category_list.map {|c| [c.category_name, c.id]}
	end
  end
  
  def show
    id = params[:id]
    @privatepost = Privatepost.find(params[:id])
  end
  
  def create
    @privatepost  = current_user.privateposts.build(params[:privatepost])
	@category = Category.find(params[:category_id])
	@privatepost.category = @category
    if @privatepost.save

      flash[:success] = "Note posted!"
      redirect_to @privatepost  # NOTE -- Should redirect to 'show' view
    else
	  @feed_items = []
	  #@category_list = Category.find(:all)
	  #@reformatted_category_list = @category_list.map {|c| [c.category_name, c.id]}
      render 'pages/home'
    end
  end

  def edit
    @privatepost = Privatepost.find(params[:id])
    @category_list = Category.find(:all)
    @reformatted_category_list = @category_list.map {|c| [c.category_name, c.id]}
  end
  
  def update
    @privatepost = Privatepost.find(params[:id])
    if @privatepost.update_attributes(params[:privatepost])
      flash[:notice] = "Successfully updated note."
      redirect_to @privatepost
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @privatepost.destroy
    redirect_back_or root_path
  end
  
  def index
    @privateposts = Privatepost.all
  end
  
  def tag_cloud
    @tags = Privatepost.tag_counts # returns all the tags used
  end
  
  private

    def authorized_user #Gives authorization beforehand with before_filter for delete action
      @privatepost = Privatepost.find(params[:id])
      redirect_to root_path unless current_user?(@privatepost.user)
    end
end
