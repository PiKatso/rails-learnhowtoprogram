class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new
  end

  def create
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new(lesson_params)
    if @lesson.save
      redirect_to lessons_path
    else
      render :new
    end
  end

  def edit
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to section_path(@lesson.section)
    else
      render :edit
    end
  end

  def destroy_all
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    @lesson.destroy_all
    redirect_to section_path
  end

private
  def lesson_params
    params.require(:lesson).permit(:name, :content, :number)
  end

end
