module ApplicationHelper
  def current_theme
    session[:style] || 'light'
  end

  def switch_theme
    if current_theme == 'light'
      session[:style] = 'dark'
    else
      session[:style] = 'light'
    end
  end
end
