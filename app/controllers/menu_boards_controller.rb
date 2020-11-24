class MenuBoardsController < ApplicationController

  helper_method :cleanCategoryTitle, :cleanItemTitle

 #Adding a feed instance variable to the home action.
  def home
    @user = current_user
    @category = Category.new
    if logged_in?
      @categories = @user.menu.categories
    end

  end

  def update
    category = Category.find(params["category_id"])
    is_published = if params["is_published"] == "on" then true else false end
      
    if category.update_attributes(:name => params["name"], :priority => params["priority"], :is_published => is_published)
      flash[:success] = "Category was successfully updated."
     redirect_to root_url
    else
      flash[:error] = "An error accurred while updating the category."
    end
  end

  def contact_us
    begin
      UserMailer.say_hello(params).deliver_later
      flash[:info] = "Message sent successfully."
      redirect_to root_url
    rescue Exception => e
      raise e
    end
  end

  def index
    render :template => 'menu_boards/home'
  end

  def help
  end

  def about
  end

  def contact
  end
end
