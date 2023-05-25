class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show edit destroy ]

# GET /bookmarks or /bookmarks.json
def index
  @bookmarks = Bookmark.all
end

# GET /bookmarks/1 or /bookmarks/1.json
def show
end

# GET /bookmarks/new
def new
  @list = List.find(params[:list_id])
  @bookmark = Bookmark.new
end

# GET /bookmarks/1/edit
def edit
end

  # POST /bookmarks or /bookmarks.json
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to bookmark_url(@bookmark), notice: "bookmark was successfully created." }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: "bookmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Only allow a bookmark of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:name)
    end
end
