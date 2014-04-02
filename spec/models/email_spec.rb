require 'spec_helper'

describe Email do
  it { should validate_presence_of :address }
  it { should validate_presence_of :contact_id }

  it { should belong_to :contact }
end
