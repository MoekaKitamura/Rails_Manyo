class LavelsController < ApplicationController
  before_action :set_lavel, only: %i[ show edit update destroy ]

  # def index
  #   @lavels = Lavel.all
  # end

  # def show
  # end

  def new
    @lavel = Lavel.new
  end

  def edit
  end

  def create
    @lavel = Lavel.new(lavel_params)
    if @lavel.save
      redirect_to @lavel, notice: "Lavel was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @lavel.update(lavel_params)
      redirect_to @lavel, notice: "Lavel was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lavel.destroy
      redirect_to lavels_url, notice: "Lavel was successfully destroyed."
  end

  private
  def set_lavel
    @lavel = Lavel.find(params[:id])
  end

  def lavel_params
    params.require(:lavel).permit(:lavel_name)
  end
end
