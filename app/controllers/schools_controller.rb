class SchoolsController < ApplicationController

  def notices
    @notices=Notice.all.reverse_order.page(params[:page]).per(8)
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
    render layout: 'user_layout'
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
      @students=@selected_class.students
    else
      @students=@selected_class.students.where(:roll_no=>params[:roll_no])
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

end
