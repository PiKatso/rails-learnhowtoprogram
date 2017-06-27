class SectionsController < ApplicationController
  def index
    @sections = Section.all
    @chapter = Chapter.find(params[:id])
  end

  def show
    @chapter = Chapter.find(params[:chapter_id])
    @section = @chapter.sections.find(params[:id])
  end

end
