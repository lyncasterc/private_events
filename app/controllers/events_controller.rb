class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

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

  def unattend
    @event = Event.find(params[:id])
    attendees_events = AttendeesEvent.find_by(attendee_id: current_user.id, event_id: @event.id)
    attendees_events.destroy

    redirect_to @event, notice: "You are no longer attending this event!"
  end

  def new
    @event = current_user.created_events.build
  end

  def edit
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

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event updated!" }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end 
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id), notice: "Event deleted!" }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :time, :location, :image)
  end
end
