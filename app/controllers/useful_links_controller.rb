class UsefulLinksController < ApplicationController

  def index
    @useful_links=UsefulLink.all.reverse_order.page(params[:page]).per(3)
    @useful_link=UsefulLink.new
    render layout: 'admin_layout'
  end

  def create
    @useful_link=UsefulLink.new(params_useful_link)
    # raise params_student.inspect
    if @useful_link.save
      flash[:notice] = "Link Added successfully."
      redirect_to useful_links_path
    else
      flash[:alert] = "Title and link can't be blank."
      redirect_to useful_links_path
    end
  end

  def destroy
    @useful_link=UsefulLink.find(params[:id])
    @useful_link.destroy
    flash[:alert] = "Link deleted successfully."
    redirect_to useful_links_path
  end

  protected
  def params_useful_link
    params.require(:useful_link).permit(:title,:link)
  end

end
