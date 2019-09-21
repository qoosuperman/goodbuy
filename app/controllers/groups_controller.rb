class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :find_group, only: [:edit]

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

  def create
    clean_params = params.require(:group).permit(:title, :description, :address, :phone, :is_active, :start_time, :end_time, :is_public, products_attributes:[:name, :price, :_destroy], options_attributes:[:name, :price, :_destroy])
     #這裏之後要改掉 User.first
    @group = User.first.groups.new(clean_params)
    if @group.save
      redirect_to my_groups_path
    else
      render :new
    end
  end

  private
  def find_group
    @group = Group.find_by(id: params[:id])
  end
end
