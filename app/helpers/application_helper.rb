module ApplicationHelper
  def show_login_or_logout_link
    if @authenticated_user
      "<li>" + link_to("Logout", logout_path) + "</li>" +
      "<li>" + link_to("Settings", edit_user_path(@authenticated_user))+ "</li>"
    else
      "<li>" + link_to("Login", login_path) + "</li>"
    end
  end

  def show_user_name
    if @authenticated_user
      @authenticated_user.name
    end
  end
end