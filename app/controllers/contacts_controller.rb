class ContactsController < ApplicationController

  def index
    @contacts=Contact.all.reverse_order.page(params[:page]).per(10)
    render layout: 'admin_layout'
  end

  def destroy
    @contact=Contact.find(params[:id])
    @contact.destroy
    flash[:alert] = "Mail deleted successfully."
    redirect_to contacts_path
  end

end
