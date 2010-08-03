class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def contact
	@title = "Contact"
  end

  def about
	@title = "About"
  end
  
  def help
	@title = "Help"
  end
  
  def notes
    @title = "Note"
  end
end
