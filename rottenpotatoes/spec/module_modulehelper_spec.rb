require 'rails_helper'

# used this link https://stackoverflow.com/questions/1542945/testing-modules-in-rspec

class DummyClass
end

describe 'MoviesHelper' do
    
    before(:each) do
      @dummy_class = DummyClass.new
      @dummy_class.extend(MoviesHelper)
    end

    it "check oddness function" do
      expect(@dummy_class.oddness(2)).to eq "even"
      expect(@dummy_class.oddness(3)).to eq "odd"
    end
end