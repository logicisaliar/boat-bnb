module ApplicationHelper
  def hidden_element?
    params[:controller] == (("devise/sessions" || "devise/registrations") && params[:action] == "new")
  end
end
