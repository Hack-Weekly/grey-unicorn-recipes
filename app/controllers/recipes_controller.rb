class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    api_response = RecipeApi.request_recipes_for("hot dogs")

    if api_response[:success]
      @recipes = api_response[:data].first(8)
    else
      @errors = api_response[:error]
    end
  end

  # GET /recipes/1 or /recipes/1.json
  def show; end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.author = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    query = params[:query]
    @db_recipes = Recipe.where("title ILIKE ?", "%#{query}%")
    api_response = RecipeApi.request_recipes_for(query)

    if api_response[:success]
      @api_recipes = api_response[:data]
      @recipes = (@db_recipes + @api_recipes).first(8)
      respond_to do |format|
        format.turbo_stream
        format.html { render :index }
      end
    else
      @errors = api_response[:error]
      flash[:alert] = @errors
      redirect_to recipes_path
    end
  end

  def ingredient_field; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(
      :title,
      :instructions,
      :author_id,
      ingredients_attributes: [:id, :name, :quantity, :_destroy]
    )
  end
end
