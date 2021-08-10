class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def attend
    @event = Event.find(params[:id])

    attendees_events = AttendeesEvent.new(attendee_id: current_user.id, event_id: @event.id)
    if attendees_events.save
      redirect_to @event, notice: "You are now attending this event!"
    else
      redirect_to @event, alert: "You are already attending this event!"
    end
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event created!" }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end 
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
