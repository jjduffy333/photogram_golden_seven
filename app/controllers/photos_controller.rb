class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @photo = Photo.find_by({ :id => params[:id]})
  end

  def new_form

      end

    def create_row
      p = Photo.new
      p.caption = params[:the_caption]
      p.source = params[:the_source]
      p.save

      # render("create_row.html.erb")
      redirect_to("http://localhost:3000/photos")
    end

    def delete_row
      d = Photo.find_by({ :id => params[:id]})
      d.destroy
      d.save

      # render("create_row.html.erb")
      redirect_to("http://localhost:3000/photos")

    end

    def edit_row
      e = Photo.find_by({ :id => params[:id]})
      e.caption = params[:the_caption_new]
      e.source = params[:the_source_new]
      e.save
    end

end
