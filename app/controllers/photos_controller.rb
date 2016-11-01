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

    def edit_form
      @photo = Photo.find_by({ :id => params[:id]})
    end

    def update_row
      p = Photo.find_by({ :id => params[:id]})
      p.caption = params[:the_caption]
      p.source = params[:the_source]
      if p.save
        redirect_to "/photos/#{params[:id]}", :notice => "Photo updated successfully."
      else
        render 'edit_form'
      end
    end

end
