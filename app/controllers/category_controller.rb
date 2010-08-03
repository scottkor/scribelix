class CategoryController < ApplicationController
before_filter :authenticate, :only => [:create, :destroy]

  def new
    @category = Category.new
	@title = "Category"
  end

  def create
    @category = Category.new(params[:category])
	if @category.save
       redirect_to (:action => "list")
    else
       render (:action => "new")
    end
  end

  def list
    @category_list = Category.find(:all)
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
	@category = Category.find(params[:id])
	if @category.update_attributes(params[:category])
	  flash[:success] = "Category updated."
	  redirect_to(:action => 'list')
	else
	  render(:action => 'edit')
	end
  end
  
  def destroy
    @category = Category.find(params[:id])
	@category.destroy
    flash[:success] = "Category destroyed."
    redirect_to (:action => "list")
  end

end
