class ResultsController < ApplicationController

  def index
    @results=Result.all.reverse
    render layout: 'admin_layout'
  end

  def new
    @result=Result.new
    render layout: 'admin_layout'
  end

  def create
    @result=Result.new(params_result)
    # raise params_student.inspect
    if @result.save
      flash[:notice] = "Result Created successfully."
      redirect_to results_path
    else
      flash[:alert] = "Title can't be blank and choose a valid profile photo."
      redirect_to results_path
    end
  end

  def show
    @result=Result.find(params[:id])
    render layout: 'admin_layout'
  end

  def edit
    @result=Result.find(params[:id])
    render layout: 'admin_layout'
  end

  def update
    @result=Result.find(params[:id])
    # raise params_student.inspect
    if @result.update(params_result)
      flash[:notice] = "Result information Updated successfully."
      redirect_to results_path
    else
      flash[:alert] = "Result title can't be blank."
      redirect_to edit_result_path(@result)
    end
  end

  def destroy
    @result=Result.find(params[:id])
    @result.destroy
    flash[:alert] = "Result deleted successfully."
    redirect_to results_path
  end
  IMAGES_PATH = File.join(Rails.root, "public")

  def download
    # send_file (File.basename(params[:file_path]))
    send_file Rails.root.join('public', params[:file_path]), :type=>"application/pdf", :x_sendfile=>true
    # send_file "#{Rails.root.to_s}/public"  +  params[:file_path]
    # send_file(File.join(IMAGES_PATH, params[:file_path]))
  end

  # def download
  #   # raise params.inspect
  #   send_file(params[:file_path])
  # end

  protected
  def params_result
    params.require(:result).permit(:title,:body, :file).merge(:level_id=>params[:level_id])
  end

end
