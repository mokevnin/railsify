module ApplicationWorker
  extend ActiveSupport::Concern

  included do
    include Sidekiq::Worker
  end

  def async_perform(args)
    #FIXME logging
    super
  end
end
