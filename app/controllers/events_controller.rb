class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  #before_action :subscription_policy, only: [:subscribe, :unsubscribe]
  respond_to :html


  def index
    @events = (Event.where(kind: 'global') + current_user.events.all).uniq
  end

  def show
    @policy = SubscriptionPolicy.new(current_user, @event)
  end

  def edit
  end

  def new
    @event = current_user.events.new
  end

  def subscribe
    @event = Event.find(params[:event_id])
    if !subscription_policy(@event).subscribed?
      @subscription = subscribe_create(@event)
      respond_to do |v|
        v.html { redirect_to event_path(@event), notice: 'You was successfully subscribed on this event'}
      end
    else
      respond_to do |v|
        v.html { redirect_to event_path(@event), notice: 'You are already subscribed on this event' }
      end
    end
  end

  def unsubscribe
    @event = Event.find(params[:event_id])
    if !subscription_policy(@event).subscribed?
      respond_to do |v|
        v.html { redirect_to event_path(@event), notice: 'You are not subscribed on this event yet'}
      end
    else
      @subscription = Subscription.find_by(user: current_user, event: @event)
      @subscription.destroy
      respond_to do |v|
        v.html { redirect_to event_path(@event), notice: 'You were unsubscribed from this event'}
      end
    end
  end

  def create
    @event = current_user.events.new(event_params)
    subscribe_create(@event)
    respond_to do |v|
      if @event.save
        v.html { redirect_to events_url, notice: 'Event was successfully created.' }
      else
        v.html { redirect_to new_event_url, notice: 'Error'}
      end
    end
  end

  def update
    respond_to do |v|
      if @event.update(event_params)
        v.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        v.html { render :edit, notice: 'Error'}
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |v|
      v.html { redirect_to root_path, notice: 'Event was successfully deleted' }
    end
  end

  def subscribed_events
    @events = current_user.events
  end

  private
  def event_params
    params.require(:event).permit(:name, :start_time, :user_id, :kind)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def subscribe_create(event)
    @subscription = Subscription.create(user: current_user, event: event)
  end

  def subscription_policy(event)
    @policy = SubscriptionPolicy.new(current_user, event)
  end
end
