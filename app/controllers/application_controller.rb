class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

#-------------------------------
# e.g. Login page
#-------------------------------

# class ApplicationController < ActionController::Base
#   before_action :require_login
#   def require_login
#     # ログインを確認し、非ログイン時にリダイレクトする処理
#   end
# end
#
# class LoginsController < ApplicationController
#   # 「ログインをするための画面」にログインが必要では
#   # いつまでもログインができないので、require_loginをスキップする
#   skip_before_action :require_login, only: [:new, :create]
# end
