class TeachersController < ApplicationController

  def index
    @teachers=Teacher.all
    render layout: 'admin_layout'
  end

  def new
    @teacher=Teacher.new
    render layout: 'admin_layout'
  end

  def show
    @teacher=Teacher.find(params[:id])
    render layout: 'admin_layout'
  end

  def create
    @teacher=Teacher.new(params_teacher)
    # raise params_student.inspect
    if @teacher.save
      flash[:notice] = "Teacher Added successfully."
      redirect_to teachers_path
    else
      flash[:alert] = "Name can't be blank and choose a valid profile photo."
      redirect_to new_teacher_path
    end
  end

  def edit
    @teacher=Teacher.find(params[:id])
    render layout: 'admin_layout'
  end

  def update
    @teacher=Teacher.find(params[:id])
    # raise params_student.inspect
    if @teacher.update(params_teacher)
      flash[:notice] = "Teacher's information Updated successfully."
      redirect_to teachers_path
    else
      flash[:alert] = "Please insert name and choose profile photo correctly."
      redirect_to edit_teacher_path(@teacher)
    end
  end

  def destroy
    @teacher=Teacher.find(params[:id])
    @teacher.destroy
    flash[:alert] = "Teacher deleted successfully."
    redirect_to teachers_path
  end

  protected

  def params_teacher
    params.require(:teacher).permit(:name,:email, :phone, :qualification, :designation, :address,:profile_photo,:gender)
  end
end
