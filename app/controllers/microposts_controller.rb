class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :edit, :update, :destroy]
  before_filter :authorized_user, :only => [:edit, :update, :destroy]
  
  def new
    if signed_in?
    @micropost = Micropost.new 
	@micropost.posted = Time.now
	@category_list = Category.find(:all)
	@reformatted_category_list = @category_list.map {|c| [c.category_name, c.id]}
	end
  end
  
  def show
    id = params[:id]
    @micropost = Micropost.find(params[:id])
  end
  
  def create
    @micropost  = current_user.microposts.build(params[:micropost])
	@category = Category.find(params[:category_id])
	@micropost.category = @category
    if @micropost.save
      flash[:success] = "Note posted!"
      redirect_to @micropost  # NOTE -- Should redirect to 'show' view
    else
	  @feed_items = []
	  @category_list = Category.find(:all)
	  @reformatted_category_list = @category_list.map {|c| [c.category_name, c.id]}
	   flash[:error] = "NFailed"
      render 'pages/home'
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
    @category_list = Category.find(:all)
    @reformatted_category_list = @category_list.map {|c| [c.category_name, c.id]}
  end
  
  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(params[:micropost])
      flash[:notice] = "Successfully updated note."
      redirect_to @micropost
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @micropost.destroy
    redirect_back_or root_path
  end
  
  private

    def authorized_user #Gives authorization beforehand with before_filter for delete action
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user?(@micropost.user)
    end
end