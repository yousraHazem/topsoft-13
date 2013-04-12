require 'spec_helper'

describe Receipt do
  before { @receipt = Receipt.new(budget_component_id: 1, image: "ddkdfsfds" , name: "budget comonent name")  }
  subject { @receipt }

  it { should respond_to(:budget_component_id) } 
  it { should respond_to(:image) }
  it { should respond_to(:name) }

  it { should be_valid }
include CarrierWave::Test::Matchers 
	 before do
    Receipt.enable_processing = true
    @uploader = Receipt.new(@receipt, :image)
    @uploader.store!(File.open(path_to_file))
  end

  after do
    Receipt.enable_processing = false
  end
end



