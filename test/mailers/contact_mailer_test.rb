require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "sent_message" do
    mail = ContactMailer.sent_message
    assert_equal "Sent message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
