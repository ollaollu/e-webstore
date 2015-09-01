class ContactsController < ApplicationController

  def index
    
  end

  def create
    gb = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    list_id = ENV['MAILCHIMP_LIST_ID']

    gb.lists(list_id).members.create(
      body: {
        email_address: params[:email],
        status: 'subscribed',
        merge_fields: {"FULLNAME": params[:fullname], "MESSAGE": params[:message]}
    })

    flash[:success] = "Your inquiry has been submitted"

    redirect_to contact_path
  end

end