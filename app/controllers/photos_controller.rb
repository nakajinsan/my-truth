class PhotosController < ApplicationController
  before_action :set_group
  before_action :set_photos
  before_action :set_photo, only:[:show, :destroy]
  
  def index
    @groups = Group.new
    @photos = @group.photos.includes(:user)
  end

  def new
    @photo = Photo.new
  end
  
  def create
    @photo = @group.photos.new(photo_params)
    if @photo.save
      redirect_to group_photos_path(@group), notice: 'my truthを作成しました'
    else
      @photos = @group.photos.includes(:user)
      flash.now[:alert] = '入力してください。'
      render :new
    end
  end

  def show
  end

  def destroy
    @photo.destroy
    redirect_to root_path,notice:'削除に成功しました'
  end


  private
  def photo_params
    params.require(:photo).permit(:name,:image,:nated_food,:dislike_word,:hate_human,:weaknes,:remark).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_photos
    @photos = Photo.all
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
