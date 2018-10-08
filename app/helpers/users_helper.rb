module UsersHelper

  def conditional_content
    if @current_user.trips.empty?
      content_tag(:p, "Looks like you don't have any trips yet.")
    else
      render 'content'
    end
  end
  
end
