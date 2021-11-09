class CommentsController < ApplicationController
    def create
        @album = Album.find(params[:album_id])
        @comment = @album.comments.create(params[:comment].permit(:name,:body,:created_at))
        redirect_to album_path(@album)
    end
    def destroy
        @album = Album.find(params[:album_id])
        @comment = @album.comments.find(params[:id])
        @comment.destroy
        redirect_to album_path(@album)
    end
end
