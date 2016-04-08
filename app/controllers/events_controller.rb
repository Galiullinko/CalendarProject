class EventsController < ApplicationController
  respond_to :html

  expose(:event, attributes: :event_params)
  #???
  #expose(:events) { Event.page(params[:page]) }

  def index
    @events = Event.all
  end

  def create
    flash[:notice] = 'Event was successfully created.' if event.save

  end

  def update
    flash[:notice] = 'Event was successfully updated.' if event.save

  end

  def destroy
    event.destroy

  end

  private
  def event_params
    params.require(:event).permit(:name, :start_time)
  end
end
