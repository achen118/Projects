class TracksController < ApplicationController
  before_action :require_logged_in

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_track_url
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_track_url
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    album_id = @track.album.id
    if @track.destroy
      redirect_to album_url(album_id)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to track_url(@track)
    end
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :lyrics, :track_type, :name)
  end

end
