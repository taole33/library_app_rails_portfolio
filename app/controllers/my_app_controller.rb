class MyAppController < ApplicationController
  def top
  end

  def lend
  end

  def manage
    @books = Book.all
    @booklends = BookLend.all
  end
  
  def book_registration
    @book = Book.new
    @libraries = Library.all
  end

  def registration_success
    @book = Book.new(books_params)
    @book.library = books_params[:library][:library]
    if @book.save
      flash[:notice] = "新規登録しました"
      redirect_to("/bookmanage/registration_success/")
    else
      flash[:notice] = "！登録に失敗しました"
      @libraries = Library.all
      render action: :book_registration
    end
  end

  def registration_succeed
  end

  def book_search
    @book = Book.new
  end

  def book_searched
    isbn = params[:isbn]
    name = params[:name]  
    author = params[:author]
    publisher = params[:publisher]  
    library = params[:library]
    search = [isbn,name,author,publisher,library]

    @books = Book.isbn(search).bookname(search).author(search).publisher(search).library(search)
  end


#ユーザー登録

  def user_show
    @users = User.all
  end

  def user_registration
    @user = User.new
    @library = Library.all
  end

  def user_registration_success
    @user = User.new(users_params)
    if @user.save
      redirect_to("/bookmanage/registration_success/")
    else
      render("/bookmanage/user_registration")
    end
  end
 
  def user_edit
    @user = User.find_by(id: params[:id])
  end

  def user_update
    @user = User.find_by(id: params[:id])
    @user.update(users_params)
    
    redirect_to("/bookmanage/user_show/")
  end


#書籍アップデート、詳細

  def book_edit
    @book = Book.find_by(id: params[:id])
  end

  def book_update
    @book = Book.find_by(id: params[:id])
    @book.update(books_params)
    
    redirect_to("/bookmanage/show_exist/")
  end

  def book_detail
    @book = Book.find_by(id: params[:id])
    if @book.lend_ids[0]
      @lend = Lend.find_by(id: @book.lend_ids[0])
      @lenduser = LendUser.find_by(lend_id: @lend.id)
      @user = User.find_by(id: @lenduser.user_id)
    end
  end

#貸出関係
  def lend
    @book = Book.find_by(id: params[:id])
    @lend = Lend.new
    @lend.lend_users.build
    @lend.book_lends.build
    @users = User.all
    if BookLend.exists?(book_id: @book.id)
      redirect_to action: :lend_error
    end
  end

  def lend_error
  end

  def lend_registration_success
    @user = User.find_by(id: lends_params[:user_ids][:user_id])
    @book = Book.find_by(id: params[:id])
    @lend = Lend.new(lends_date)
    if BookLend.exists?(book_id: @book.id)
      redirect_to action: :lend_error
    else
      if @lend.valid?
        @lend.save
        LendUser.create(lend: @lend, user: @user)
        BookLend.create(book: @book, lend: @lend)
        redirect_to("/bookmanage/registration_success/")
      else
        flash[:notice] = "！登録に失敗しました"
        @users = User.all
        render action: :lend
      end
    end
  end

  def return_book_list
    @books = Book.joins(:book_lends)
  end

  def return
    @book = Book.find_by(id: params[:id])
    if not BookLend.exists?(book_id: @book.id)
      redirect_to action: :return_error
    else
      @booklend = BookLend.find_by(book_id: @book.id)
      @lenduser = LendUser.find_by(lend_id: @booklend.lend_id)
      userid = @lenduser.user_id
      @user = User.find_by(id: userid)
      
    end
  end

  def return_error
  end

  def return_registration_success
    @book = Book.find_by(id: params[:id])
    if not BookLend.exists?(book_id: @book.id)
      redirect_to action: :return_error
    else
      @booklend = BookLend.find_by(book_id: @book.id)
      @lenduser = LendUser.find_by(lend_id: @booklend.lend_id)
      @lend = Lend.find_by(id: @booklend.lend_id)
      @booklend.destroy
      @lenduser.destroy
      @lend.destroy
      redirect_to action: :registration_succeed
    end
  end

#図書館管理
  def library
    @libraries = Library.all
    @library = Library.new
  end

  def library_destroy
    @library = Library.find_by(id: params[:id])
    @library.destroy
        
    redirect_to("/bookmanage/library/")
  end

  def library_registration
    @library = Library.new(library: params[:library])
    @library.save
    flash[:notice] = "登録しました"
    redirect_to("/bookmanage/library/")
  end


#strong parameters関係
  private

  def books_params
    params.require(:book).permit(:isbn, :name, :author,:publisher,library:[:library])
  end

  def users_params
    params.require(:user).permit(:username, :userbirthday,:useraddress)
  end

  def lends_params
    params.require(:lend).permit(:lenddate,user_ids:[:user_id])
  end
  
  def lends_date
    params.require(:lend).permit(:lenddate)
  end




end
