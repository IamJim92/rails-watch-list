class ListsController < ApplicationController
  def index
    @lists = List.all
  end
# new list bookmark_path
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: "list created successfully"
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
