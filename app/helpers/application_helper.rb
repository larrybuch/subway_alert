module ApplicationHelper
  def show_login_or_logout_link
    if @authenticated_user
      link_to "Logout", logout_path
    else
      link_to "Login", login_path
    end
  end

  def show_user_name
    if @authenticated_user
      @authenticated_user.name
    end
  end
end