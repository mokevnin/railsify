class ApplicationMailView < MailView
  include FactoryGirl::Syntax::Methods

  #TODO попробовать сделать пулреквет в mail_view
  class << self
    def mail(method_name, &block)
      define_method method_name do
        result = nil
        ActiveRecord::Base.transaction do
          @method = method_name
          result = instance_eval &block
          @method = nil
          raise ActiveRecord::Rollback
        end

        result
      end
    end

    def mailer_klass
      "#{self.name.gsub('MailView', '')}Mailer".constantize
    end
  end

  def generate(*args)
    self.class.mailer_klass.send @method, *args
  end
end
