class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @movie = Movie.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_strong)
    if (@list.save)
      redirect_to list_path(@list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def params_strong
    params.require(:list).permit(:name, :photo)
  end
end
