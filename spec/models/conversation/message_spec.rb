require 'rails_helper'

RSpec.describe Conversation::Message, type: :model do
  it { should belong_to(:conversation) }
  it { should belong_to(:sender) }
end
