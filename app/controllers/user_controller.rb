class UserController < ApplicationController
    def index
        @albums = current_user.albums
    end
end
