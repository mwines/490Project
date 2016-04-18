class AnnouncementsController < ApplicationController
	def new
      @announcement = Announcement.new
	end

  def update
  @announcement = Announcement.find(params[:id])
 
  if @announcement.update(announcement_params)
    redirect_to @announcement
  else
    render 'edit'
  end
end

  def edit
      @announcement = Announcement.find(params[:id])
  end

	def index
    	@announcement = Announcement.all
  end

	def show
    	@announcement = Announcement.find(params[:id])
  end

	def create
  		@announcement = Announcement.new(announcement_params)
 
  		if @announcement.save
        redirect_to @announcement
      else
        render 'new'
	end
end
 
	private
  	def announcement_params
    	params.require(:announcement).permit(:title, :text)
  	end
end
