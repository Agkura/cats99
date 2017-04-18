class CatRentalRequestsController < ApplicationController
  def create
    @rental = CatRentalRequest.new(cat_rental_request_params)
    if @rental.save
      redirect_to cat_url(Cat.find_by(id: params[:cat_rental_request][:cat_id]))
    else
      render :new
    end
  end

  def new
    @cats = Cat.all
    @rental = CatRentalRequest.new
    render :new
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
