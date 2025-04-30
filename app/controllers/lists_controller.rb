class ListsController < ApplicationController
  def index
    raise
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new(strong_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @list = List.new
  end

  private

  def strong_params
    params.require(:list).permit(:name)
  end
end
