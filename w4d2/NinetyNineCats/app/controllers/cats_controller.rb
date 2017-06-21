class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = selected_cat
    @requests = CatRentalRequest.where(cat_id: @cat.id)
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = selected_cat
    render :edit
  end

  def update
    @cat = selected_cat
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      render edit_cat_url(@post)
    end
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      redirect_to new_cat_url
    end
  end


  private
    def selected_cat
      Cat.find_by(id: params[:id])
    end
    def cat_params
      params.require(:cat).permit(:name, :birth_date, :sex, :color, :description)
    end

end
