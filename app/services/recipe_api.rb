class RecipeApi
  def self.request_recipes(user_query, recipe_count = 10)
    conn = Faraday.new(
      url: 'https://api.api-ninjas.com',
      params: { query: user_query, offset: recipe_count },
      headers: { "X-Api-Key": ENV['RECIPE_API_KEY'] }
    )

    conn.get('/v1/recipe')
  end
end
