class CatRentalRequestsController < ApplicationController

  def index
    render text: "INDEX"
  end

  def new
    @cat_rental_request = CatRentalRequest.new
    @cat_rental_request.cat_id = params[:cat_id]

    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cat_cat_rental_request_url(@cat_rental_request.cat_id, @cat_rental_request.id)
    else
      render :error
    end
  end

  def show
    @cat_rental_request = CatRentalRequest.find(params[:id])
    render :show
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date,
                                               :end_date, :status)
  end
end
