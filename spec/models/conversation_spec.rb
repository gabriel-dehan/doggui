require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it { should belong_to(:dog) }
  it { should have_many(:messages)}
end
