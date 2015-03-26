class User < ActiveRecord::Base

  #so these are what?? I don't understand they're a bunch of methods??
  # before_save {self.email = email.downcase} #especially don't understand this syntax
  # # don't know what this does! Is it something specific to active record?
  # validates :name, presence:  true, length: {maximum: 50}
  # # validates(:name, presence: true) <-- analogous
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, length: {maximum: 255} , format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  # validates :password, presence:true, length: {minimum: 6}
  # has_secure_password

    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }

end
