class CatRentalRequestsController < ApplicationController
  before_action :require_logged_in
  before_action :owns_cat, only: [:approve, :deny]

  def approve
    current_cat_rental_request.approve!
    redirect_to cat_url(current_cat)
  end

  def create
    @rental_request = current_user.requests.new(cat_rental_request_params)
    if @rental_request.save
      redirect_to cat_url(@rental_request.cat)
    else
      flash.now[:errors] = @rental_request.errors.full_messages
      render :new
    end
  end

  def deny
    current_cat_rental_request.deny!
    redirect_to cat_url(current_cat)
  end

  def new
    @rental_request = current_user.requests.new
  end

  private
  def current_cat_rental_request
    @rental_request ||=
      CatRentalRequest.includes(:cat).find(params[:id])
  end

  def current_cat
    current_cat_rental_request.cat
  end

  def cat_rental_request_params
    params.require(:cat_rental_request)
      .permit(:cat_id, :end_date, :start_date, :status)
  end

  def owns_cat
    cat_id = CatRentalRequest.find_by(id: params[:id]).cat_id
    unless current_user.cats.exists?(id: cat_id)
      flash[:errors] = ["You must own this cat to approve or deny"]
      redirect_to cat_url(cat_id)
    end
  end

end
