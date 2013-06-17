# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  dob             :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'spec_helper'

describe User do
  before { @user =  User.new(name: "example User", email: "user@example.com",
                             password: "foobar", password_confirmation: "foobar",
                             dob: "12/12/1988" )}
  subject(:it) { @user }

  it "responds to attributes" do
    expect(it).to respond_to(:name)
    expect(it).to respond_to(:email)
    expect(it).to respond_to(:dob)
    expect(it).to respond_to(:password_digest)
    expect(it).to respond_to(:password)
    expect(it).to respond_to(:password_confirmation)
    expect(it).to respond_to(:authenticate)

    expect(it).to be_valid
  end

  it "is valid with a name and an email" do
    expect(it).to be_valid
  end

  it "is invalid without a name" do
    @user.name = "  "

    expect(it).to have(1).errors_on(:name)
  end

  it "is invalid without an email" do
    @user.email = "  "

    expect(it).to have(2).errors_on(:email)
  end

  it "is invalid without a proper date" do
    @user.dob = "aaaa"

    expect(it).to have(1).errors_on(:dob)
  end

  it "is invalid with too long name" do
    @user.name = "a" * 51

    expect(it).to have(1).errors_on(:name)
  end

  it "is invalid with wrong email format" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                   foo@bar_baz.com foo@bar+baz.com]
    addresses.each do | invalid_address |
      @user.email = invalid_address

      expect(it).to have(1).errors_on(:email)
    end
  end

  it "is invalid with duplicate email address" do
    @user_with_same_email = @user.dup
    @user_with_same_email.email = @user.email.upcase
    @user_with_same_email.save

    expect(it).to have(1).errors_on(:email)
  end

  it "is invalid when password is not present" do
    @user.password = @user.password_confirmation = " "

    expect(it).to have(2).errors_on(:password)
  end

  it "is invalid when passwords mismatch" do
    @user.password_confirmation = "mismatch"

    expect(it).to have(1).errors_on(:password)
  end

  it "is invalid when pass confirmation is nil" do
    @user.password_confirmation = nil
    expect(it).to have(1).errors_on(:password_confirmation)
  end

  context "return value of authenticate method" do
    before { @user.save }
    before { @found_user = User.find_by_email(@user.email) }

    it "is valid with valid password" do

      expect(@found_user.authenticate(@user.password)).to be_true
    end

    it "is invalid with invalid password" do

      expect(@found_user.authenticate("invalid")).to be_false
    end
  end

  it "is invalid when password is too short" do
    @user.password = @user.password_confirmation = "a" * 5

    expect(it).to have(1).errors_on(:password)
  end
end
