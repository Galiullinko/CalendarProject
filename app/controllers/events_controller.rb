class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @events = Event.all.order(start_time: :desc)
    @type = request.params[:format]
  end

  def show
  end

  def edit
  end

  def create
    @meeting = current_user.event.new(event_params)
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

  def set_event
    @event = Event.find(params)
  end
end
