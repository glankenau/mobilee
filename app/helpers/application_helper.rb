# app/helpers/application_helper.rb
module ApplicationHelper
  def hide_header?
    # List the routes where you want to hide the footer

    return false if request.path == root_path
    hide_header_routes = ['thanks', 'surveys', 'questions']

    # Check if the current route matches any in the list
    hide_header_routes.none? { |route| request.path.starts_with?("#{route}") }
  end

  def hide_footer?
    return false if request.path == root_path
    # List the routes where you want to hide the footer

    hide_footer_routes = ['thanks', 'surveys*', 'questions*']

    # Check if the current route matches any in the list
    hide_footer_routes.none? { |route| request.path.starts_with?("#{route}") }
  end
end
