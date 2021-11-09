class AlbumsController < ApplicationController
    def index
        @albums = Album.all
    end
    def show
        @album = Album.find(params[:id])
        @tag = current_user.tags.all
    end
    def new
        @album = Album.new
    end
    def create
        @album = current_user.albums.new(album_params)
        if @album.save
            redirect_to root_path
        else
            render :new
        end
    end
    def edit 
        @album = Album.find(params[:id])
    end
    def update
        @album = Album.find(params[:id])
        #   debugger
          if @album.update(album_params)
            redirect_to root_path
          else
            render :edit
          end
    end
    def destroy
        @album =Album.find(params[:id])
        if @album.destroy
        redirect_to root_path
        end
    end
    def delete_image_attachment
        @image = ActiveStorage::Attachment.find(params[:id])
        @image.purge
        if @image.destroy
        redirect_to root_path
        end
    end
    def tagged_photo
       blob = params[:blob_id] 
       tagged = params[:tagged]
       current_user.tags.create(blob_id:blob,tagged:tagged)
   end
    private 
    def album_params
     params.require(:album).permit(:name,:description,images: [])
    end
end
