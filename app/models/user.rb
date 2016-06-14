class User < ActiveRecord::Base
  has_many :posts, {class_name: :Post, foreign_key: :author_id}
  has_many :comments, {class_name: :Comment, foreign_key: :author_id}
  has_many :votes

  validates :username, :email, :password_digest, { presence: true }
  validates :email, uniqueness: true

  has_secure_password

  # def password
  #   @password ||= BCrypt::Password.new(password_digest)
  # end

  # def password=(new_password)
  #   @password = BCrypt::Password.create(new_password)
  #   self.password_digest = @password
  # end

  def self.authenticate(given_email, given_password)
    if user = self.find_by(email: given_email)
      if user.password == given_password
        return user
      end
    end
  end

end