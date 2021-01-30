class MyAppController < ApplicationController
  def top
  end

  def lend
  end

  def manage
    @books = Book.all
  end
  
  def book_regist
    @book = Book.new
  end

  def regist_success
    @book = Book.new(books_params)
    if @book.save
      flash[:notice] = "新規登録しました"
      redirect_to("/bookmanage/regist_success/")
    else
      render("bookmanage/book_regist")
    end
  end

  def regist_succeed
  end

  def book_search
  end

  def book_searched
    isbn = params[:isbn]
    name = params[:name]  
    author = params[:author]
    publisher = params[:publisher]  

    if isbn or name or author or publisher
      search = [isbn,name,author,publisher]
      @books = Book.search(search)
    else
      render("/bookmanage/book_search")
    end
  end


  def user_show
    @users = User.all
  end

  def user_regist
    @user = User.new
    @library = Library.all
  end

  def user_regist_success
    @user = User.new(users_params)
    if @user.save
      redirect_to("/bookmanage/regist_success/")
    else
      render("/bookmanage/user_regist")
    end
  end
  
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
  end

  def lend
  end

  def library
    @libraries = Library.all
    @library = Library.new
    #= collection_check_boxes(:library, :category_ids, Category.all, :id, :name ) do |t|
    #=t.label { t.check_box + t.text }
  end

  def library_destroy
    @library = Library.find_by(id: params[:id])
    @library.destroy
        
    redirect_to("/bookmanage/library/")
  end

  def library_regist
    @library = Library.new(library: params[:library])
    @library.save
    flash[:notice] = "登録しました"
    redirect_to("/bookmanage/library/")
  end

  def books_params
    params.require(:book).permit(:isbn, :name, :author,:publisher,:library)
  end

  def users_params
    params.require(:user).permit(:username, :userbirthday,:useraddress)
  end



end
