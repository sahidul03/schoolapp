class SpeechesController < ApplicationController
  def index
    @speeches=Speech.all.reverse
    @speech=Speech.new
    render layout: 'admin_layout'
  end

  def create
    @speech=Speech.new(params_speech)
    # raise params_student.inspect
    if @speech.save
      flash[:notice] = "Speech Created successfully."
      redirect_to speeches_path
    else
      flash[:alert] = "Title can't be blank and choose a valid file format."
      redirect_to speeches_path
    end
  end

  def edit
    @speech=Speech.find(params[:id])
    render layout: 'admin_layout'
  end

  def update
    @speech=Speech.find(params[:id])
    # raise params_student.inspect
    if @speech.update(params_speech)
      flash[:notice] = "Speech information Updated successfully."
      redirect_to speeches_path
    else
      flash[:alert] = "Speech title can't be blank."
      redirect_to edit_speech_path(@speech)
    end
  end

  def destroy
    @speech=Speech.find(params[:id])
    @speech.destroy
    flash[:alert] = "Speech deleted successfully."
    redirect_to speeches_path
  end

  protected
  def params_speech
    params.require(:speech).permit(:title,:body, :image, :head)
  end

end
