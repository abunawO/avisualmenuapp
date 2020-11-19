class MenuBoardsController < ApplicationController

  helper_method :cleanCategoryTitle

 #Adding a feed instance variable to the home action.
  def home
    byebug
    @user = current_user
    @category = Category.new
    if logged_in?
      byebug
      @categories = @user.menu.categories
    end

  end

  def update
    byebug
    category = Category.find(params["category_id"])
    category.name = params["name"]
    category.priority = params["priority"]
    category.is_published = if params["is_published"] == "on" then true else false end
    if category.save!
      flash[:success] = "Category was successfully updated."
     redirect_to root_url
    else
      flash[:error] = "AN error accurred while updating the category."
    end
  end

  #can be used in view
  def cleanCategoryTitle string
    string.strip
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
