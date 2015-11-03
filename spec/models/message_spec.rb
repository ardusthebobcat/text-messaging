require 'rails_helper'
require 'rest-client'

describe Message, vcr: true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '15005550006')
    message.save.should be false
  end

  it 'adds an error if the to number is invalid' do
    message = Message.create(:body => 'hi', :to => '1111111', :from => '+15005550006')
    message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end
end
