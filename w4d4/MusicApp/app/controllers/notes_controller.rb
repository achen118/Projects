class NotesController < ApplicationController
  before_action :require_logged_in
  before_action :note_owner, only: [:destroy]

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      redirect_to track_url(@note.track.id)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track.id)
    end
  end

  def destroy
    @note = current_user.notes.find_by(id: params[:id])
    track = @note.track
    if @note.destroy
      redirect_to track_url(track.id)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(track.id)
    end
  end

  private

  def note_params
    params.require(:note).permit(:body, :user_id, :track_id)
  end

  def note_owner
    note = Note.find_by(id: params[:id])
    unless current_user.id == note.user_id
      render text: "You cannot delete this note", status: 403
    end
  end

end
