require 'rails_helper'

RSpec.describe Basic, type: :model do
  
  it "some_shit" do
  	# attrs = attributes_for(:basic)
  	# puts attrs

  	o = ('a'..'z').to_a.shuffle[0,8].join
  	puts o

  	expect(build(:basic , phone: "123456789")).not_to be_valid
  end
end
