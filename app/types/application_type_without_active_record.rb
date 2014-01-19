module ApplicationTypeWithoutActiveRecord
  extend ActiveSupport::Concern

  included do
    include ActiveModel::Validations
    include ActiveModel::Conversion
    include ActiveModel::Translation
    include Virtus.model
  end

  module ClassMethods
    def _args
      attribute_set.to_a.map(&:name)
    end
  end

  def persisted?
    false
  end
end
