class RecipeApi

  attr_accessor :last_query, :offset

  def initialize
    @last_query = ''
    @offset = 0
  end

  def request_recipes(user_query:, offset: 0)
    @last_query = user_query
    conn = Faraday.new(
      url: 'https://api.api-ninjas.com',
      params: { query: user_query , offset: offset},
      headers: { "X-Api-Key": ENV['RECIPE_API_KEY'] }
    ) { |f| f.response :json }

    response = conn.get('/v1/recipe')

    if response.success?
      data = response.body
      if data.empty?
        return {success: false, error: {status: nil, message: "No results found"} }
      end

      recipe_bundle = response.body.map { |recipe| convert_recipe(recipe) }
      return {success: true, data: recipe_bundle}
    else
      status_code = response.status
      error_message = response.body['error'] || 'Unknown error occured'
      Rails.logger.error("API request failed with status #{status_code}: #{error_message}")
      {success: false, error: {status: status_code, message: error_message}}
    end  
  rescue Faraday::Error => e
    Rails.logger.error("API request failed with exception: #{e.message}")
    { success: false, error: { status: nil, message: "Server error, please try again later"}}
  end

  def convert_recipe(json_body)
    ApiRecipe.new(json_body)
  end

  # TODO: add pagintation logic
end
