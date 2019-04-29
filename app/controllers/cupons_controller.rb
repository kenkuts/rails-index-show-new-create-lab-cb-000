class CuponsController < ApplicationController
  before_action :set_cupon, only: :show

  def index
    @cupons = Cupon.all
  end

  def new
  end

  def create
    @cupon = Cupon.create(cupon_code: params[:cupon_code],
    store: params[:store])

    redirect_to cupon_path(@cupon)
  end

  def show
  end

  private

  def set_cupon
    @cupon = Cupon.find(params[:id])
  end
end
