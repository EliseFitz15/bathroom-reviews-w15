class BathroomsController < ApplicationController
  def index
    @bathrooms = Bathroom.all
  end

  def show
    @bathroom = Bathroom.find(params[:id])
    @reviews = @bathroom.reviews
  end

  def new
    @bathroom = Bathroom.new
  end

  def create
    @bathroom = Bathroom.new(bathroom_params)

    if @bathroom.save
      flash[:notice] = "Bathroom added successfully"
      redirect_to bathroom_path(@bathroom)
    else
      flash[:errors] = @bathroom.errors.full_messages.join(". ")
      render :new
    end
  end

  private
  def bathroom_params
    params.require(:bathroom).permit(:name, :address, :city, :state, :zip, :description)
  end
end
