class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_courses = current_user.courses
    @user_orders = current_user.orders
  end

  def create
    @orders = Order.new
    @orders.user = current_user
    @orders.course = @course = Course.find(params[:course_id])
    @orders.save

    respond_to do |format|
      if @orders.save
        format.html { redirect_to  orders_index_path, notice: ' ya te Inscribiste felicidades.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { redirect_to courses_url, notice: ' fallo tu inscripcion. #{@matricula.errors.messages} ' }
      end
    end
  end
  def edit
  end

  def destroy
    @orders = Order.where(user: current_user, course: params[:course_id])
    if @orders.first.destroy
      respond_to do |format|
        format.html { redirect_to orders_index_path, notice: 'Post was successfully destroyed.' }
      end
    end
  end

  def show
  end
  end
