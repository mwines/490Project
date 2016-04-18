class UploadController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
	  name = params[:upload][:file].original_filename
    directory = "public/images/upload"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
    flash[:notice] = "File uploaded"
    
    @upload = Upload.new(upload_params)

    if @upload.save
      redirect_to @upload
    else
      render 'new'
    end
  end

  def index
    @upload = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def upload_params
      params.require(:upload).permit(:name)
  end
end
