class RentalsController < ApplicationController
  def index
  end

  def new
    @rental = Rental.new
    @car_categories = CarCategory.all
    @clients = Client.all
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save!
      flash[:notice] = 'Locação realizada com sucesso'
      redirect_to @rental
    else
      @car_categories = CarCategory.all
      @clients = Client.all
      flash.now[:alert] = 'Você deve preencher todos os campos'
      render 'new'
    end
  end

  def show
    @rental = Rental.find(params[:id])
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :car_category_id, :client_id)
  end
end
