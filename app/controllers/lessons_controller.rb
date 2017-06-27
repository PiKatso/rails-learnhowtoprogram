class LessonsController < ApplicationController
  def index
    @section = Section.find(params[:id])
    @lessons = Lesson.all
  end

  # passing in a parent object (above-> @section) in the view make this nesting work
  def show
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.find(params[:id])
  end

  def new
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new
  end

  def create
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new(lesson_params)
    if @lesson.save
      redirect_to chapter_path(@lesson.section.chapter)
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    @section = @lesson.section
  end

  def update
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to chapter_path(@lesson.section.chapter)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @section = @lesson.section
    @lesson.destroy
    redirect_to chapter_path(@lesson.section.chapter)
  end

private
  def lesson_params
    params.require(:lesson).permit(:name, :content, :number)
  end

end
