class MessageDecorator  < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def format
    [
      object.user.email,
      object.phone_number,
      object.text,
      I18n.l(object.created_at.to_date)
    ]
  end
end