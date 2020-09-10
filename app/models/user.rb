class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

validates :nickname, uniqueness: { case_sensitive: true }, presence: true
validates :password, format: { with: PASSWORD_REGEX, message: '半角英数字混在、6文字以上で入力してください' }

end