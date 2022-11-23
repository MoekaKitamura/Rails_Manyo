class LabelsController < ApplicationController
  before_action :set_label, only: %i[ show edit update destroy ]

  # def index
  #   @labels = label.all
  # end

  # def show
  # end

  def new
    @label = Label.new
  end

  def edit
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to @label, notice: "label was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @label.update(label_params)
      redirect_to @label, notice: "label was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @label.destroy
      redirect_to labels_url, notice: "label was successfully destroyed."
  end

  private
  def set_label
    @label = label.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:label_name)
  end
end
