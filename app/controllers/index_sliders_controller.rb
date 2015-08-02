class IndexSlidersController < ApplicationController
  def index
    @index_sliders=IndexSlider.all.reverse
    @index_slider=IndexSlider.new
    render layout: 'admin_layout'
  end

  def create
    @index_slider=IndexSlider.new(params_index_slider)
    # raise params_student.inspect
    if @index_slider.save
      flash[:notice] = "Slider Image uploaded successfully."
      redirect_to index_sliders_path
    else
      flash[:alert] = "Title can't be blank and choose a valid file format."
      redirect_to index_sliders_path
    end
  end

  def edit
    @index_slider=IndexSlider.find(params[:id])
    render layout: 'admin_layout'
  end

  def update
    @index_slider=IndexSlider.find(params[:id])
    # raise params_student.inspect
    if @index_slider.update(params_index_slider)
      flash[:notice] = "Slider information Updated successfully."
      redirect_to index_sliders_path
    else
      flash[:alert] = "Slider title and image can't be blank."
      redirect_to edit_index_slider_path(@index_slider)
    end
  end

  def destroy
    @index_slider=IndexSlider.find(params[:id])
    @index_slider.destroy
    flash[:alert] = "Slider Image deleted successfully."
    redirect_to index_sliders_path
  end

  protected
  def params_index_slider
    params.require(:index_slider).permit(:title,:body, :image)
  end
end
