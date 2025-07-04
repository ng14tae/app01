class GuestSessionsController < ApplicationController
  def create
    user = User.find_or_create_by(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.first_name = "ゲスト"
      user.last_name = "ユーザー"
    end
    session[:user_id] = user.id
    flash[:notice] = "ゲストユーザーとしてログインしました"
    redirect_to new_product_path
  end
end
