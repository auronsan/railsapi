
require 'rails_helper'

RSpec.describe User, type: :model do
 
  # Validation tests
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:created_by) }
end
