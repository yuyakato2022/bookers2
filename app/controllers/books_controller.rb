class BooksController < ApplicationController
  before_action :authenticate_user!

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comment = BookComment.new

  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
     redirect_to books_path unless current_user.id == @book.user_id
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have updated user successfully."
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book .update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body,)
  end


end
