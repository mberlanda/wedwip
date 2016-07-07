class PlaceDecorator  < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def format
    [
      object.address,
      object.reason,
      object.user.email
    ]
  end
end