require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Private::ConversationsHelper. For example:
#
# describe Private::ConversationsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Private::ConversationsHelper, type: :helper do
  context '#contact_user_partial_path' do
    before(:each) do
      @current_user = create(:user, id: 1)
      helper.stub(:current_user).and_return(@current_user)
    end

    it "returns a contact_user partial's path" do
      helper.stub(:user_signed_in?).and_return(true)
      assign(:post, create(:post, user_id: create(:user, id: 2).id))
      expect(helper.contact_user_partial_path).to(
        eq 'posts/show/contact_user' 
      )
    end

    it "returns an empty partial's path" do
      helper.stub(:user_signed_in?).and_return(true)
      assign(:post, create(:post, user_id: @current_user.id))

      expect(helper.contact_user_partial_path).to(
        eq 'shared/empty_partial'
      )
    end

    it "returns an empty partial's path" do
      helper.stub(:user_signed_in?).and_return(false)
      expect(helper.contact_user_partial_path).to(
        eq 'posts/show/login_required'
      )
    end
  end

  context '#leave_message_partial_path' do
    it "returns an already_in_touch partial's path" do
      assign('message_has_been_sent', true)
      expect(helper.leave_message_partial_path).to(
        eq 'posts/show/contact_user/already_in_touch'
      )
    end

    it "returns an already_in_touch partial's path" do
      assign('message_has_been_sent', false)
      expect(helper.leave_message_partial_path).to(
        eq 'posts/show/contact_user/message_form'
      )
    end
  end

  context '#load_private_messages' do
    let(:conversation) { create(:private_conversation) }

    it "returns load_messages partial's path" do
      create(:private_message, conversation_id: conversation.id)
      expect(helper.load_private_messages(conversation)).to eq (
        'private/conversations/conversation/messages_list/link_to_previous_messages'
      )
    end

    it "returns empty partial's path" do
      expect(helper.load_private_messages(conversation)).to eq (
        'shared/empty_partial'
      )
    end
  end

end
