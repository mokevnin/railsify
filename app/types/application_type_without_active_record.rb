module ApplicationTypeWithoutActiveRecord
  extend ActiveSupport::Concern

  included do
    include ActiveModel::Validations
    include ActiveModel::Conversion
    include Virtus
  end

  def persisted?
    false
  end
end
