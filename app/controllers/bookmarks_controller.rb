class BookmarksController < ApplicationController

  before_action :set_bookmark, only: :destroy

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end


  def destroy
    @bookmark= Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmarks_params)
    @bookmark.list = @list
     if @bookmark.save
      redirect_to list_path(@list)
     else
      render :new
     end
  end

private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

end
