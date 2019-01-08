class CoursesController < ApplicationController
before_action :authenticate_user!
before_action :set_course, only: [:show, :edit, :update, :destroy]
authorize_resource

  def index
    @courses = Course.all
  end
  def show
    @order = Order.new
  end
  def create
    @course = Course.new(course_params)
    @course.tipo = params[:tipo]
    @course.save
    redirect_to courses_url, notice: 'has creado un nuevo curso.'
  end
  def new
    @course = Course.new
  end

  def destroy
    if @course.destroy
      respond_to do |format|
        format.html { redirect_to courses_url, notice: 'Post was successfully destroyed.' }
      end
    end
  end


  private
    def set_course
      @course = Course.find(params[:id])
    end
    def course_params
      params.require(:course).permit(:name, :description, :type)
    end
end
