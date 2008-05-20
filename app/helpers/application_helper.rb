# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # If params[:page] is null it returns null
  # otherwise returns an html-safe params[:page]
  #
  # If this were to be part of a gem, it would need to have
  # the page parameter be a variable, since some folks won't
  # user :page as their query string variable
  #
  # If you are editing a Model named Page, and validation
  # fails, there will be a params[:page], which will be very different
  #
  # But if you are on show page, you are probably still using params[:page]
  #
  # This will use the key you pass in, and try params[:page] if that's null
  def page_param(key = :page)
    key_to_use = params[key].blank? ? :page : key
    params[key_to_use].blank? ? nil : h(params[key_to_use])
  end
end
