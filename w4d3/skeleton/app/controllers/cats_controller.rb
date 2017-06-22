class CatsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create, :edit, :update]
  before_action :owns_cat, only: [:edit, :update]

  helper_method :requester_username

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    # @current_user.cats.new(cat_params)
    @cat = current_user.cats.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = current_user.cats.find(params[:id])
    render :edit
  end

  def update
    @cat = current_user.cats.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat)
      .permit(:age, :birth_date, :color, :description, :name, :sex)
  end

  def owns_cat
    unless current_user.cats.exists?(id: params[:id])
      flash[:errors] = ["You do not own this cat!"]
      redirect_to cats_url
    end
  end

  def requester_username(req_id)
    requester_id = CatRentalRequest.find_by(id: req_id).user_id
    User.find_by(id: requester_id).user_name
  end

end
