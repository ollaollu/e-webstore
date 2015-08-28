class ContactsController < ApplicationController

  def new

  end

  def create
    @list_id = ENV['MAILCHIMP_LIST_ID']
    gb = Gibbon::API.new

    gb.lists.subscribe({
      :id => @list_id,
      :email => {:email => params[:email]},
      :merge_vars => {:FULLNAME => params[:fullname], :MESSAGE => params[:message]},
      :double_optin => false
      })
  end

end
