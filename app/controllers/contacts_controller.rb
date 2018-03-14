class ContactsController < ApplicationController

def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  	   redirect_to new_contact_path, flash: {n: "送信しました"}
    else
      render :new
    end
  end

  def index
  	@contacts = Contact.all
  end

  def destroy
  	@contact = Contact.find(params[:id])
  	@contact.destroy
  	redirect_to contacts_path, flash: {n: "削除しました"}
  end


  private
  def contact_params
  	params.require(:contact).permit(:name,:kana_name,:email,:phone, :message)
  end
end
