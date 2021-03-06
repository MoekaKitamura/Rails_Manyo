class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    include SessionsHelper
    before_action :login_required
    private
    def login_required
        redirect_to new_session_path, alert: "ログインしてください。" unless current_user
    end
    def already_logged_in
        redirect_to tasks_path, notice: "ログインしています。" if current_user
    end
    def same_user_or_admin_required
        redirect_to user_path(current_user.id), notice: "違うユーザー情報は見れません！これがあなたです。" unless @user.id == current_user.id || current_user.admin == true 
    end
    def admin_required
        redirect_to tasks_path, notice: "管理者のみアクセス可能です。" unless current_user.admin == true 
    end
end
