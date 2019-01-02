FactoryBot.define do
  factory :conversation_message, class: 'Conversation::Message' do
    conversation { nil }
    sender { nil }
    content { "MyText" }
  end
end
