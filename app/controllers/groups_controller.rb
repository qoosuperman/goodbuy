class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group, only: [:edit, :update, :close, :link]

  require 'rqrcode'

  def index
  end

  def my
    @groups = current_user.groups
  end

  def attend
    @groups = Order.where(buyer_id: current_user.id).map{ |order| order.group }
  end

  def public
    @groups = Group.where(is_public: true)
  end

  def new
    @group = current_user.groups.build
    @group.products.build
  end

  def edit 
  end

  def update
    if @group.update(group_params)
      redirect_to my_groups_path
    else
      render :edit
    end
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to my_groups_path
    else
      render :new
    end
  end

  def close
    @group.update(is_active: false)
    redirect_to my_groups_path
  end

  def link
    @link = edit_group_url
    qrcode = RQRCode::QRCode.new(@link)
    
    # NOTE: showing with default options specified explicitly
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )
    
    IO.write("/tmp/github-qrcode.png", png.to_s)
  end

  private
  def find_group
    @group = Group.find_by(id: params[:id])
  end

  def group_params
    clean_params = params.require(:group).permit(:title, :description, :address, :phone, :is_active, :start_time, :end_time, :is_public, :shop_photo, products_attributes:[:name, :price, :_destroy], options_attributes:[:name, :price, :_destroy])
  end
end
