class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted?
        flash[:notice] = "ユーザーの新規登録が完了しました"
      end
    end
  end
end