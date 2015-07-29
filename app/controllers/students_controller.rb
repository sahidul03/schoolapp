class StudentsController < ApplicationController

  def index
    @selected_class=Level.find(10)
    render layout: 'admin_layout'
  end

  def new
    @student=Student.new
    render layout: 'admin_layout'
  end

  def edit
    @student=Student.find(params[:id])
    render layout: 'admin_layout'
  end

  def create
    @student=Student.new(params_student)
    # raise params_student.inspect
    if @student.save
      flash[:notice] = "Student Added successfully."
      redirect_to students_path
    else
      flash[:alert] = "Please name and Roll no insert correctly."
      redirect_to new_student_path
    end
  end

  def update
    @student=Student.find(params[:id])
    # raise params_student.inspect
    if @student.update(params_student)
      flash[:notice] = "Student Updated successfully."
      redirect_to students_path
    else
      flash[:alert] = "Please name and Roll no insert correctly."
      redirect_to new_student_path
    end
  end

  def destroy
    @student=Student.find(params[:id])
    @student.destroy
    flash[:notice] = "Student deleted successfully."
    redirect_to students_path
  end

  protected

  def params_student
    params.require(:student).permit(:name,:father_name, :mother_name, :guardian_name, :guardian_contact_no, :roll_no, :address,:profile_photo,:gender).merge(:level_id=>params[:level_id])
  end

end
