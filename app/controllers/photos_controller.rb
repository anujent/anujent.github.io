class PhotosController < ApplicationController

	#layout false

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)
    @name = @photo.author

    id = User.find_by_sql("select id from users where login='#{@name}'")
    if id.any?
  	if @photo.save
  		flash[:success] = "The photo was added!"
  		redirect_to root_path
  	else
  		render 'new'
    end
    else

      flash[:success] = "Please enter the SPC Login Name!" # red notice to be implemented
      render 'new'
      end
  end

  def index

  	@photos = Photo.order('created_at')
  end

  def project_content
    @photo = Photo.find(params[:id])

    @videos = Photo.find_by_sql("select * from photos where author ='#{params[:username]}' and id <> #{params[:id]}")



  end

  private

  def photo_params
    #user_id_1 = 6


    params.require(:photo).permit(:image, :title, :author)
  end



end
