module ApplicationHelper
  include HtmlHelper

  def is_root?
    current_page?(root_path) || current_page?(root_path(locale: I18n.locale))
  end
end