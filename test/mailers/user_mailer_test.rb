require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    @user = users(:uoserv)
    @user.activation_token = User.new_token
    mail = UserMailer.account_activation(@user)
    assert_equal "Account activation", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["noreply@uoserv.dev"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "password_reset" do
    user = users(:uoserv)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "Password Reset", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@uoserv.dev"], mail.from
    assert_match user.reset_token,        mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end
end
