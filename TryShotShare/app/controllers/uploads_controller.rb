class UploadsController < ApplicationController
	hash = Hash.new
	def index
		@upload = Upload.new
	end

	def edit
      @user = User.find(params[:user_id])
      @upload = Upload.find(params[:id])
    end
    
	def create
		@user = User.find(params[:user_id])
		@upload = @user.uploads.create(upload_params)
		hash = Cloudinary::Uploader.upload(@upload.image.path)
		@upload["public_id"] = hash["public_id"]
		@upload["url"] = hash["url"]
		@user.uploads.push(@upload)
		if @upload.save
			render json: { message: "success", uploadId: @upload.id }, status: 200
		else
			render json: { error: @upload.errors.full_messages.join(", ") }, status: 400
		end
	end

	private

	def upload_params
		params.require(:upload).permit(:image)
	end
end
