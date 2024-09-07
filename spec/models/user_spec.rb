require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      firstname: "test",
      lastname: "test",
      birthday: "2024-09-03",
      gender: "Male",
      email: "test@test.com",
      phonenumber: "0987654321",
      subject: "css"
    )
  end

  it 'ข้อมูลตรงตาม Mock up' do
    expect(user.firstname).to eq("test")
    expect(user.lastname).to eq("test")
    expect(user.birthday.strftime("%Y-%m-%d")).to eq("2024-09-03")
    expect(user.gender).to eq("Male")
    expect(user.email).to eq("test@test.com")
    expect(user.phonenumber).to eq("0987654321")
    expect(user.subject).to eq("css")
  end

  it 'มีข้อมูลทั้งหมดครบถ้วน' do
    expect(user).to be_valid
  end  

  describe "validates First Name" do
    it "First Name ต้องไม่เป็นค่าว่าง" do
      user.firstname = nil
      expect(user).to be_invalid
      expect(user.errors[:firstname]).to include("First Name can't be blank.")
    end
  end

  describe "validates Last Name" do
    it "Last Name ต้องไม่เป็นค่าว่าง" do
      user.lastname = nil
      expect(user).to be_invalid
      expect(user.errors[:lastname]).to include("Last Name can't be blank.")  
    end
  end
  
  describe "validates Birth Date" do
    it "Birth Date ต้องไม่เป็นค่าว่าง" do
      user.birthday = nil
      expect(user).to be_invalid
      expect(user.errors[:birthday]).to include("Birth Date can't be blank.")  
    end
  end
  
  describe "validates gender" do
    it "Gender ต้องไม่เลือก" do
      user.gender = nil
      expect(user).to be_invalid
      expect(user.errors[:gender]).to include("Please select a gender.") 
    end
  end

  describe "validates Email" do
    it "Email ต้องไม่เป็นค่าว่าง" do
      user.email = nil
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("Email can't be blank.") 
    end

    it "Email ต้องเป็นรูปแบบอีเมลไม่ถูกต้อง" do
      user.email = "test"
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("Invalid email format.") 
    end
  end

  describe "validates Phone Number" do
    it "Phone Number ต้องไม่เป็นค่าว่าง" do
      user.phonenumber = nil
      expect(user).to be_invalid
      expect(user.errors[:phonenumber]).to include("Phone Number can't be blank.") 
    end

    it "Phone Number ต้องเป็นตัวเลขเท่านั้น ใส่ตัวอักษรแทน" do
      user.phonenumber = "test"
      expect(user).to be_invalid
      expect(user.errors[:phonenumber]).to include("Phone Number should contain only digits.") 
    end
  end

  describe "validates Subject" do
    it "subject ต้องไม่เลือก" do
      user.subject = nil
      expect(user).to be_invalid
      expect(user.errors[:subject]).to include("Please select a subject.") 
    end
  end
end
