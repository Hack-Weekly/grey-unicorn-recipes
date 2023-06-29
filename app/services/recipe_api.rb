class RecipeApi

  attr_accessor :last_query, :offset

  def initialize
    @last_query = ''
    @offset = 0
  end

  def request_recipes(user_query:, offset: 0)
    # TODO: add error handling and handle no more results
    @last_query = user_query
    conn = Faraday.new(
      url: 'https://api.api-ninjas.com',
      params: { query: user_query , offset: offset},
      headers: { "X-Api-Key": ENV['RECIPE_API_KEY'] }
    ) { |f| f.response :json }

    response = conn.get('/v1/recipe')

    response.map { |recipe| convert_recipe(recipe) }
  end

  def convert_recipe(json_body)
    ApiRecipe.new(json_body)
  end

  # TODO: add pagintation logic
end
