module ApplicationHelper
  def login_helper(style = "")
    if !user_signed_in?
      link_to("Register", new_user_registration_path, class: "navbar-item") +
        " ".html_safe +
        link_to("Login", new_user_session_path, class: "navbar-item")
    else
      link_to(
        "Logout",
        destroy_user_session_path,
        data: {
          turbo_method: :delete
        },
        class: "navbar-item"
      )
    end
  end

  def active?(path)
    "active" if current_page? path
  end

  def flash_class(level)
    case level.to_sym
    when :notice
      "bg-primary"
    when :success
      "bg-success"
    when :alert
      "bg-warning"
    when :error
      "bg-danger"
    else
      "bg-info"
    end
  end

  def authorized_to
    logged_in?(:admin) || logged_in?(:author)
  end

  def profile_helper(user)
    unless user.profile.file.nil?
      image_tag(
        member.profile.to_s,
        width: 60,
        height: 60,
        style: "border-radius: 50%"
      ).html_safe
    else
      gravatar_helper(user)
    end
  end

  def gravatar_helper(user)
    image_tag(
      "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}",
      width: 60,
      height: 60,
      style: "border-radius: 50%;"
    )
  end
end
