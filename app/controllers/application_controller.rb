class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include CurrentUserConcern

  def after_sign_out_path_for(_resource_or_scope)
    root_url
  end

  def random_recipe
    recipe_seed = rand(0..22)
    recipe_list = ["hotdog", "hamburger", "spaghetti", "ramen", "steak", "cheese cake", "tiramisu", "pizza", "stew",
                   "chicken picatta", "fried rice", "goulash", "stroganoff", "lamb skewers", "sate", "miso soup", "chex mix", "spinach dip", "grilled chicken", "fried chicken", "salmon"]
    recipe_list[recipe_seed]
  end

  add_flash_types :info, :success, :warning

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[name location employer age link profile]
    )
  end
end
