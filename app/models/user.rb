class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :tests
has_many :studies, dependent: :destroy
has_many :study_tests, through: :studies, source: :test

PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

validates :nickname, uniqueness: { case_sensitive: true }, presence: true
validates :password, format: { with: PASSWORD_REGEX, message: '半角英数字混在、6文字以上で入力してください' }

end