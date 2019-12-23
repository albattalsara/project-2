class LessonsController < ApplicationController

    before_action :set_lesson, only: [:show]

    def index 
        @lessons = Lesson.all
    end

    def show
        @lesson = Lesson.find(params[:id])
    end

    def new 
        @lesson = current_user.lessons.new 
    end

    def create
        @lesson = current_user.lessons.create(lesson_params)
        redirect_to lesson_path(@lesson)
    end


    def edit
        @lesson = current_user.lessons.create(lesson_params)
        redirect_to lesson_path(@lesson)  
    end


    def destroy
        
    end

    private 
   def set_lesson 
     Lesson.find(params[:id])
   end

   def lesson_params
        params.require(:lesson).permit(:title, :image_url, :duration, :cost, :description)
    end
       

end
