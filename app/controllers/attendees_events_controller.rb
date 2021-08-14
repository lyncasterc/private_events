class AttendeesEventsController < ApplicationController
  private

  def attendees_event_params
    params.require(:attendees_event).permit(:event_id)
  end
end
