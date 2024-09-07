class User < ApplicationRecord
    validates :firstname, presence: { message: "First Name can't be blank." }
    validates :lastname, presence: { message: "Last Name can't be blank." }
    validates :birthday, presence: { message: "Birth Date can't be blank." }
    validates :gender, presence: { message: "Please select a gender." }
    validates :email, presence: { message: "Email can't be blank." }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format." }
    validates :phonenumber, presence: { message: "Phone Number can't be blank." }, format: { with: /\A[0-9]+\z/, message: "Phone Number should contain only digits." }
    validates :subject, presence: { message: "Please select a subject." }
end
