class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    #if current_user
      #@categories = Category.where(:user_id => current_user.id)
    #else
    redirect_to root_url
    #end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    #if current_user
      #@user = current_user
    #else
    redirect_to root_url
    #end
  end

  # GET /categories/new
  def new
    #if current_user
      #@user = current_user
      #@category = Category.new
    #else
    redirect_to root_url
    #end
  end

  # GET /categories/1/edit
  def edit
    #if current_user
      #@user = current_user
      #@category = Category.find(params["id"])
      #@selected_category = @category.name
    #else
    redirect_to root_url
    #end
  end

  # POST /categories
  # POST /categories.json
  def create
    result = _create_and_add_category_to_menu category_params
    #respond_to do |format|
    if result.eql?(true)
      #format.html { redirect_to @category, notice: 'Category was successfully created.' }
      #format.json { render :show, status: :created, location: @category }
      flash[:success] = "Category was successfully created."
      redirect_to root_url
    else
      #format.html { render :new }
      #format.json { render json: @category.errors, status: :unprocessable_entity }
      flash[:error] = "#{result}"
      redirect_to root_url
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    if @category.destroy
      flash[:success] = "Category was successfully destroyed."
      redirect_to root_url
    else 
      flash[:info] = "An error occured while deleting the Category."
      redirect_to root_url
    end
    #respond_to do |format|
      #format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :priority, :is_published, :user_id)
    end

    def _create_and_add_category_to_menu category_params
      if current_user.menu.categories.create([category_params]).first.save
        return true
      else 
        errors = current_user.menu.categories.create([category_params]).first.errors
        logger.debug errors.messages
        return errors.messages
      end
    end
end
