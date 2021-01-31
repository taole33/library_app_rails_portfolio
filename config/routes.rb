Rails.application.routes.draw do
  get 'bookmanage/top/'        => 'my_app#top'

#貸出画面
  get 'bookmanage/:id/lend/' =>'my_app#lend'
  post 'bookmanage/:id/lend/'    => 'my_app#lend_registration_success'
  get 'bookmanage/lend_error/' => 'my_app#lend_error'
  get 'bookmanage/return_book_list/' => 'my_app#return_book_list'
  get 'bookmanage/:id/return/'    => 'my_app#return'
  post 'bookmanage/:id/return/' => 'my_app#return_registration_success'
  get 'bookmanage/return_error/'    => 'my_app#return_error'

#書籍管理画面  
  get 'bookmanage/show_exist/' => 'my_app#manage'
  get 'bookmanage/book_registration/'     => 'my_app#book_registration'
  post 'bookmanage/book_registration/'     => 'my_app#registration_success'
  get 'bookmanage/:id/edit'    =>'my_app#book_edit'
  post 'bookmanage/:id/edit'    =>'my_app#book_update'
  get 'bookmanage/:id/detail'   =>'my_app#book_detail'

#書籍検索画面
  get 'bookmanage/book_search/' => 'my_app#book_search'
  post 'bookmanage/book_search/' => 'my_app#book_searched'

#user管理画面
  get 'bookmanage/user_registration/'    => 'my_app#user_registration'
  post 'bookmanage/user_registration'    => 'my_app#user_registration_success'
  get 'book_search' => 'my_app#book_search'
  get 'bookmanage/user_show' =>  'my_app#user_show'
  get 'bookmanage/:id/user_edit' => 'my_app#user_edit'
  post 'bookmanage/:id/user_edit' => 'my_app#user_update'

#登録成功画面
  get 'bookmanage/registration_success/' => 'my_app#registration_succeed'

#図書館管理画面
  get 'bookmanage/library/' => 'my_app#library'
  post 'bookmanage/library/:id/destroy/' => 'my_app#library_destroy'
  post 'bookmanage/library/registration/' => 'my_app#library_registration'
  get 'bookmanage/library_edit/'   => 'my_app#library_edit'
end
