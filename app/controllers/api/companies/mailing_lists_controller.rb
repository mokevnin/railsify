class Api::Companies::MailingListsController < Api::Companies::ApplicationController
  def fire_event
    @mailing_list = resource_company.mailing_lists.find(params[:id])
    #FIXME authorize_action_for @mailing_list

    @mailing_list.send :"fire_#{params.fetch(:state_machine, :state)}_event", params[:event]
    respond_with @mailing_list, location: nil
  end
end
