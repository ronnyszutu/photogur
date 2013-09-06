class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
  end

  def show
  	@picture = Picture.find(params[:id])
  end

  def new
  	@picture = Picture.new
  end

  def create
  	# make a new picture with what picture_params returns (which is a method we're calling)
    # @picture = Picture.new(picture_params) ## FOR RAILS 4 ONLY
    @picture = Picture.new(params[:picture])
    if @picture.save
      # if the save for the picture was successful, go to index.html.erb
      redirect_to pictures_url
    else
      # otherwise render the view associated with the action :new (i.e. new.html.erb)
      render :new
    end

  	# render :text => "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
  end

  ## FOR RAILS 4 ONLY
  # def picture_params
  #   params.require(:picture).permit(:artist, :title, :url)
  # end
end