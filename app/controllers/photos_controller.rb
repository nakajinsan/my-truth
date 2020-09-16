class PhotosController < ApplicationController
  before_action :set_group,only: [:index, :show, :create,:new]
  before_action :set_photos,only: [:index, :show]
  
  def index
    @groups = Group.all
  end

  def new
    @photo = Photo.new
  end
  
  def create
    @photo = @group.photos.new(photo_params)
    if @photo.save
      redirect_to root_path, notice: 'my truthを作成しました'
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
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

end
