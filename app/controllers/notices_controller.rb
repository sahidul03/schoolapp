class NoticesController < ApplicationController

  def index
    @notices=Notice.all.reverse
    @notice=Notice.new
    render layout: 'admin_layout'
  end

  def create
    @notice=Notice.new(params_notice)
    # raise params_student.inspect
    if @notice.save
      flash[:notice] = "Notice Created successfully."
      redirect_to notices_path
    else
      flash[:alert] = "Title can't be blank and choose a valid Image and file format."
      redirect_to notices_path
    end
  end

  def edit
    @notice=Notice.find(params[:id])
    render layout: 'admin_layout'
  end

  def update
    @notice=Notice.find(params[:id])
    # raise params_student.inspect
    if @notice.update(params_notice)
      flash[:notice] = "Notice information Updated successfully."
      redirect_to notices_path
    else
      flash[:alert] = "Notice title can't be blank."
      redirect_to edit_notice_path(@notice)
    end
  end

  def destroy
    @notice=Notice.find(params[:id])
    @notice.destroy
    flash[:alert] = "Notice deleted successfully."
    redirect_to notices_path
  end

  protected
  def params_notice
    params.require(:notice).permit(:title,:body, :image, :file)
  end

end
