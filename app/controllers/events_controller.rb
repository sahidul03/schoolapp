class EventsController < ApplicationController

  def index
    @events=Event.all.reverse
    @event=Event.new
    render layout: 'admin_layout'
  end

  def create
    @event=Event.new(params_event)
    # raise params_student.inspect
    if @event.save
      flash[:notice] = "Event Created successfully."
      redirect_to events_path
    else
      flash[:alert] = "Title can't be blank and choose a valid profile photo."
      redirect_to events_path
    end
  end

  def edit
    @event=Event.find(params[:id])
    render layout: 'admin_layout'
  end

  def update
    @event=Event.find(params[:id])
    # raise params_student.inspect
    if @event.update(params_event)
      flash[:notice] = "Event information Updated successfully."
      redirect_to events_path
    else
      flash[:alert] = "Event title can't be blank."
      redirect_to edit_event_path(@event)
    end
  end

  def destroy
    @event=Event.find(params[:id])
    @event.destroy
    flash[:alert] = "Event deleted successfully."
    redirect_to events_path
  end

  protected
  def params_event
    params.require(:event).permit(:title,:body, :image)
  end
end
