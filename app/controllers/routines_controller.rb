class RoutinesController < ApplicationController
  def index
    @routines=Routine.all.reverse
    @routine=Routine.new
    render layout: 'admin_layout'
  end

  def create
    @routine=Routine.new(params_routine)
    # raise params_student.inspect
    if @routine.save
      flash[:notice] = "Routine Created successfully."
      redirect_to routines_path
    else
      flash[:alert] = "Title can't be blank and choose a valid file format."
      redirect_to routines_path
    end
  end

  def edit
    @routine=Routine.find(params[:id])
    render layout: 'admin_layout'
  end

  def update
    @routine=Routine.find(params[:id])
    # raise params_student.inspect
    if @routine.update(params_routine)
      flash[:notice] = "Routine information Updated successfully."
      redirect_to routines_path
    else
      flash[:alert] = "Routine title can't be blank."
      redirect_to edit_routine_path(@routine)
    end
  end

  def destroy
    @routine=Routine.find(params[:id])
    @routine.destroy
    flash[:alert] = "Routine deleted successfully."
    redirect_to routines_path
  end

  protected
  def params_routine
    params.require(:routine).permit(:title,:body, :file)
  end

end
