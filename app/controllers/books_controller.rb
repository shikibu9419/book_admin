class BooksController < ApplicationController
  # アクションコールバックの設定
  before_action :set_book, :detect_mobile_variant, only: [:show, :edit, :update, :destroy]
  # Another method
  # before_action do
  #   redirect_to access_denied_path if params[:token].blank?
  # end

  # public のメソッドが呼び出される
  def show
    @book = Book.find(params[:id])
    # リクエストを受け付けるファイルタイプ
    respond_to do |format|
      format.html
      format.csv
      format.json
    end

    # # app/views/<Model>/<Action>.<respond>.erb を基にビューの生成?
    # render :show
  end

  private def set_book
    @book = Book.find(params[:id])
  end

  private def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ /iPhone/
  end
end

#-------------------------------
# Mass Assignment脆弱性
# -> StrongParametersで対策
#--------------------
# class ProfileController < ApplicationController
#   def update
#     user = current_user
#     # params[:user] => {name: "bob", email: "bob@example.com"}
#     user.update(user_params)
#   end
#
#   private
#   # 外部から渡されるパラメータをそのまま信用せず、
#   # ホワイトリスト方式で検査する。
#   #  - リクエストには:user キーが必要
#   #  - user内で受け付けるのは:name, :emailキーのみ
#   def user_params
#     params.require(:user).permit(:name, :email)
#     if current_user.admin?
#       params.require(:user).permit(:name, :email, :admin)
#     else
#       params.require(:user).permit(:name, :email)
#     end
#   end
# end
