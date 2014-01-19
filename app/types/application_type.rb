module ApplicationType
  extend ActiveSupport::Concern

  module ClassMethods
    def model_name
      superclass.model_name
    end

    def name
      superclass.name
    end

    def permit(*args)
      @_args = args
    end

    def _args
      @_args
    end
  end

  def assign_attributes(attrs = {}, options = {})
    raise ArgumentError, "expected hash" if attrs.nil?
    permitted_attrs = attrs.send :permit, self.class._args
    super(permitted_attrs)
  end
end
