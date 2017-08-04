class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    @old_pictures = Picture.three_months_ago
    @pictures_by_year = Picture.pictures_created_in_year(2017)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
   @picture = Picture.new(picture_params)
   
  #  @picture.title = params[:picture][:title]
  #  @picture.artist = params[:picture][:artist]
  #  @picture.url = params[:picture][:url]

   if @picture.save
     redirect_to "/pictures"
   else
     render :new
   end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


   if @picture.save
     redirect_to "/pictures/#{@picture.id}"
   else
     render :edit
   end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

  def picture_params
   params.require(:picture).permit(:title, :artist, :url)
  end


end
