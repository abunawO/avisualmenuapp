class DishesController < ApplicationController
    #Adding authorization to the dishs controller actions
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

  def create
    @user = current_user
    result = _create_and_add_dish_to_category dish_params

    if result.eql?(true)
      flash[:success] = "Menu item created successfully!"
      redirect_to root_url
    else
      #Adding an (empty) @feed_items instance variable to the create action.
      _set_defaults
      render 'menu_boards/home'
    end
  end

  def new
    @dish = Dish.new
    @selected_category_name = params[:category]
    @category_id = params[:category_id]
  end

  def edit
    @user = current_user

    dish_id = params['dish_id'] || params['id']
    @dish = Dish.find(dish_id)

    @category = @user.menu.categories.find(params['category_id'])
    @category_id = @category.id
    @category_name = @category.name

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
      flash[:success] = "Category dish updated successfully."
      redirect_to root_url
    else
      flash[:info] = "An error occured while updating the dish."
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
      flash[:success] = "Category dish deleted successfully."
      redirect_to root_url
    else
      flash[:info] = "An error occured while deleting the dish."
    end
  end

  private

    #Adding picture to the list of permitted attributes.
    def dish_params
      params.require(:dish).permit(:name, :category, :price, :description, :picture)
    end

     def correct_user
      @dish = current_user.menu.dishes.find(params[:id])
      redirect_to root_url if @dish.nil?
    end

    def _create_and_add_dish_to_category dish_params
      if @user.menu.categories.find(params[:category_id]).dishes.create([dish_params]).first.save
        return true
      else 
        errors = @user.menu.categories.find(params[:category_id]).dishes.create([dish_params]).first.errors
        logger.debug errors.messages
        return errors.messages
      end
    end

    def _set_defaults
      @feed_dishs = []
      @categories  = []
    end

end
