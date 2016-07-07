class GuestDecorator  < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def format
    [
      capitalize_each(object.name),
      capitalize_each(object.surname),
      object.user.email,
      I18n.l(object.user.created_at.to_date)
    ]
  end

  def capitalize_each(string)
    string.split.map(&:capitalize).join
  end
end