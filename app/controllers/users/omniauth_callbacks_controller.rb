# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!

  def all
    user = User.from_omniauth(request.env["omniauth.auth"], current_user)
    if user.persisted?
      flash[:notice] = "you are successfully logged in!!"
      sign_in_and_redirect(user)
    else
      session["devise.user_attributes"] = user.attributes
      puts user.errors.full_messages
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :all
  alias_method :github, :all
  alias_method :google_oauth2, :all

  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
