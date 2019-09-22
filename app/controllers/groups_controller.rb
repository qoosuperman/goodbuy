class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :find_group, only: [:edit, :update, :close]

  def index
  end

  def my
    #這裏之後要改掉 User.first
    @current_user= User.first
    @groups = @current_user.groups
  end

  def attend
    # @current_user= User.first
    # @groups = @current_user.groups.orders.find_by(buyer_id: @current_user.id)
  end

  def public
    @groups = Group.where(is_public: true)
  end

  def new
    #  #這裏之後要改掉 User.first
    @group = User.first.groups.new
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
    render html: params
    #  #這裏之後要改掉 User.first
    # @group = User.first.groups.new(group_params)
    # if @group.save
    #   redirect_to my_groups_path
    # else
    #   render :new
    # end
  end

  def close
    @group.update(is_active: false)
    redirect_to my_groups_path
  end

  private
  def find_group
    @group = Group.find_by(id: params[:id])
  end

  def group_params
    clean_params = params.require(:group).permit(:title, :description, :address, :phone, :is_active, :start_time, :end_time, :is_public, :shop_photo, products_attributes:[:name, :price, :_destroy], options_attributes:[:name, :price, :_destroy])
  end
end
