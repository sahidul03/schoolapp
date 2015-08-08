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

end
