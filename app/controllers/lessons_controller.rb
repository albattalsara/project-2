class LessonsController < ApplicationController

    # before_action :set_lesson, only: [:show ]

    def index 
        @lessons = Lesson.all
    end

    def show
        @lesson = Lesson.find(params[:id])
        @books = @lesson.books
        @book = Book.new
        ## [{user.id : "2 ",lesson.id:"12"},{},{}]
  
        # @book_user_id = @lesson.books.find_by(user_id:current_user.id).user_id
    end

    def new 
        @lesson = current_user.lessons.new 
    end

    def create
        puts "==========================================="
        puts current_user.lessons.new
        puts "==========================================="
        @lesson = current_user.lessons.create(lesson_params)
        redirect_to '/'
    end


    def edit
        @lesson = current_user.lessons.find(params[:id])
    end

    def update
        @lesson = current_user.lessons.find(params[:id])
        @lesson.update(lesson_params)
        redirect_to lesson_path(@lesson) #lesson_path will call show method
    end

    def destroy
        @lesson = current_user.lessons.find(params[:id]) 
        @lesson.destroy
        redirect_to lessons_path	 
    end

    private 
   def set_lesson 
     Lesson.find(params[:id])
   end

   def lesson_params
        params.require(:lesson).permit(:title, :image_url, :duration, :cost, :description)
    end
       

end
