module ApplicationHelper
  include HtmlHelper
  
  def alert_class(flash_type)
    return "alert-info" if (flash_type.to_s == "notice")
    "alert-danger"
  end

  def is_root?
    current_page?(root_path) || current_page?(root_path(locale: I18n.locale))
  end
end