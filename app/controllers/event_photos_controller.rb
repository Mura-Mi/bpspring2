class EventPhotosController < ApplicationController
  before_action :set_event_photo

  def update
    @event_photo.update(event_photo_params)
    render json: @event_photo, serializer: EventPhotoSerializer
  end

  private
    def set_event_photo
      @event_photo = EventPhoto.find(params[:id])
    end

    def event_photo_params

      params.require(:event_photo).permit(:title)
    end
end
