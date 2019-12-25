class BooksController < ApplicationController

    def index 
        @lessons = Lesson.all
    end

    def show
        @lesson = Lesson.find(pramas[:id])
    end

    def new #/lesson/:id
        @book = Lesson.find(params[:id]).books.new
    end

    def create 
        @book = Lesson.find(params[:lesson_id]).books.new(user_id:current_user.id)
        if @book.save
            redirect_to lesson_path(@book.lesson_id) # redirect
        else
            redirect_to lesson_path(@book.lesson_id)
        end
       
    end    


    # private 
    # def book_params
    #     params.require(:book).permit(:name , :mobile )
    # end

end
