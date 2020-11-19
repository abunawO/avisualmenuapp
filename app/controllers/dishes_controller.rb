class DishesController < ApplicationController
    #Adding authorization to the dishs controller actions
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

  def create
    @user = current_user

    user_categories = Category.where(:user_id => @user.id)

    if user_categories.map(&:name).present?
      @categories_select = user_categories.map(&:name)
    else
      @categories_select = []
    end

    @dish = current_user.dishes.build(item_params)
    @item[:category_id] = params["category_id"]

    if @item.save
      flash[:success] = "Menu item created successfully!"
      redirect_to root_url
    else
      #Adding an (empty) @feed_items instance variable to the create action.
      _set_defaults

      render 'menu_boards/home'
    end
  end

  def new
    @item = dish.new
    @selected_category = params[:category]
    @category_id = params[:category_id]
  end

  def edit
    @user = current_user

    user_categories = Category.where(:user_id => @user.id)

    if user_categories.map(&:name).present?
      @categories_select = user_categories.map(&:name)
    else
      @categories_select = []
    end

    dish_id = params['dish_id'] || params['id']
    @dish = dish.find(dish_id)

    @category = Category.find(params['category_id'])
    @category_id = @category.id
    @category_name = @category.name

    #@selected_category = params[:category]
    #@category_id = Category.where("name LIKE ?", "%#{@selected_category}%").first.id

    if !params['edit_clicked']
      update_dish(params)
    end
  end

  def update_dish params
    @dish.name  = params[:dish][:name]
    @dish.picture  = params[:dish][:picture] if params[:dish][:picture].present?
    @dish.price    = params[:dish][:price]
    @dish.description = params[:dish][:description]

    if @dish.save
      flash[:success] = "Menu dish updated successfully."
      redirect_to root_url
    else
      flash[:info] = "An error occured while saving the menu dish."
    end
  end

  # def modal
  #   @dish = dish.find(params['dish_id'])
  # end
  def show
    @dish = dish.find(params['dish_id'])
  end

  def destroy
    if @dish.destroy
      flash[:success] = "Menu dish deleted successfully."
      redirect_to root_url
    else
      flash[:info] = "An error occured while deleting the menu dish."
    end
  end

  private

    #Adding picture to the list of permitted attributes.
    def dish_params
      params.require(:dish).permit(:name, :category, :price, :description, :picture, :category_id)
    end

     def correct_user
      @dish = current_user.dishs.find_by(id: params[:id])
      redirect_to root_url if @dish.nil?
    end

    def _set_defaults
      @feed_dishs = []
      @categories  = []
    end

end
