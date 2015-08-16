class SchoolsController < ApplicationController

  before_action :authenticate_user!,
                :except => [:notices, :notice_details, :events, :event_details, :useful_links, :routine, :video_gallery, :photo_galleries, :photo_gallery, :students,
                             :student_profile, :teachers, :teacher_profile, :committees, :committee_profile, :search_student, :results,
                             :result_details, :academic_speeches, :academic_speech, :admission, :admission_save, :principal,
                             :chairman, :contact_us]

  def notices
    @notices=Notice.all.reverse_order.page(params[:page]).per(15)
    render layout: 'user_layout'
  end

  def notice_details
    @notice=Notice.find(params[:id])
    render layout: 'user_layout'
  end

  def events
    @events=Event.all.reverse_order.page(params[:page]).per(8)
    render layout: 'user_layout'
  end

  def event_details
    @event=Event.find(params[:id])
    render layout: 'user_layout'
  end

  def useful_links
    @useful_links=UsefulLink.all.reverse_order.page(params[:page]).per(20)
    render layout: 'user_layout'
  end

  def routine
    @routines=Routine.all.reverse_order.page(params[:page]).per(12)
    render layout: 'user_layout'
  end

  def video_gallery
    @videos=Video.all.reverse_order.page(params[:page]).per(10)
    render layout: 'user_layout'
  end

  def photo_galleries
    @galleries=Gallery.all.reverse_order.page(params[:page]).per(12)
    render layout: 'user_layout'
  end

  def photo_gallery
    @photo_gallery=Gallery.find(params[:id])
    render layout: 'user_layout'
  end

  def students
    @selected_class=Level.find(10)
    render layout: 'user_layout'
  end

  def student_profile
    @student=Student.find(params[:id])
    if @student.is_accepted==false
      redirect_to students_schools_path
    else
      render layout: 'user_layout'
    end
  end

  def teachers
    render layout: 'user_layout'
  end

  def teacher_profile
    @teacher=Teacher.find(params[:id])
    render layout: 'user_layout'
  end

  def committees
    render layout: 'user_layout'
  end

  def committee_profile
    @committee=Committee.find(params[:id])
    render layout: 'user_layout'
  end

  def search_student
    @selected_class=Level.find(params[:level_id])
    if params[:roll_no] ==''
      @students=@selected_class.students.where(:is_accepted=>true)
    else
      @students=@selected_class.students.where(:roll_no=>params[:roll_no],:is_accepted=>true)
    end
    # raise @students.inspect
  end

  def results
    @results=Result.all.reverse_order.page(params[:page]).per(30)
    render layout: 'user_layout'
  end

  def result_details
    @result=Result.find(params[:id])
    render layout: 'user_layout'
  end

  def academic_speeches
    @academic_speeches=Speech.all.reverse_order.page(params[:page]).per(12)
    render layout: 'user_layout'
  end

  def academic_speech
    @academic_speech=Speech.find(params[:id])
    render layout: 'user_layout'
  end

  def admission
    @student=Student.new
    render layout: 'user_layout'
  end

  def admission_save
    @student=Student.new(params_student)
    if @student.save
      flash[:notice] = "Admission form submitted successfully."
      redirect_to root_path
    else
      render 'admission', :layout=>'user_layout'
    end
  end

  def principal
    render layout: 'user_layout'
  end

  def chairman
    render layout: 'user_layout'
  end

  def contact_us
    @contact=Contact.new
    render layout: 'user_layout'
  end

  def contact_save
    @contact=Contact.new(params_contact)
    if @contact.save
      flash[:notice] = "Email Sent successfully."
      redirect_to root_path
    else
      render 'contact_us', :layout=>'user_layout'
    end
  end

  protected

  def params_student
    params.require(:student).permit(:name,:father_name, :mother_name, :guardian_name, :guardian_contact_no, :address,:profile_photo,:gender,:birth_day).merge(:level_id=>params[:level_id],:is_accepted=>false,:roll_no=>'8888')
  end
  def params_contact
    params.require(:contact).permit(:name,:phone, :email, :subject, :body)
  end

end
