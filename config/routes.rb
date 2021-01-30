Rails.application.routes.draw do
  get 'bookmanage/top/'        => 'my_app#top'

#貸出画面
  get 'bookmanage/:id/lend/' =>'my_app#lend'

#書籍管理画面  
  get 'bookmanage/show_exist/' => 'my_app#manage'
  get 'bookmanage/book_regist/'     => 'my_app#book_regist'
  post 'bookmanage/book_regist/'     => 'my_app#regist_success'
  get 'bookmanage/:id/edit'    =>'my_app#book_edit'
  post 'bookmanage/:id/edit'    =>'my_app#book_update'
  get 'bookmanage/:id/detail'   =>'my_app#book_detail'

#書籍検索画面
  get 'bookmanage/book_search/' => 'my_app#book_search'
  post 'bookmanage/book_search/' => 'my_app#book_searched'

#user管理画面
  get 'bookmanage/user_regist/'    => 'my_app#user_regist'
  post 'bookmanage/user_regist'    => 'my_app#user_regist_success'
  get 'bookmanage/regist_success/' => 'my_app#regist_succeed'
  get 'bookmanage/library_edit/'   => 'my_app#library_edit'
  get 'book_search' => 'my_app#book_search'
  get 'bookmanage/user_show' =>  'my_app#user_show'

#登録成功画面
  get 'bookmanage/regist_success/' => 'my_app#regist_succeed'

#図書館管理画面
  get 'bookmanage/library/' => 'my_app#library'
  post 'bookmanage/library/:id/destroy/' => 'my_app#library_destroy'
  post 'bookmanage/library/regist/' => 'my_app#library_regist'
end
