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

  # 後で
  # test "password_reset" do
  #   mail = UserMailer.password_reset
  #   assert_equal "Password reset", mail.subject
  #   assert_equal [user.email], mail.to
  #   assert_equal ["noreply@uoserv.dev"], mail.from
  #   assert_match "Hi", mail.body.encoded
  # end
end
