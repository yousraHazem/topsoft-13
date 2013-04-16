require 'spec_helper'
require 'carrierwave/test/matchers'

describe receipt do
include CarrierWave::Test::Matchers 
	 before do
    Receipt.enable_processing = true
    @uploader = Receipt.new(@receipt, :image)
    @uploader.store!(File.open(path_to_file))
  end

  after do
    Receipt.enable_processing = false
  end

it "no name entered" do
	no_name_receipt = Receipt.new(:name => " ")
	no_name_receipt.should_not be_valid
end

end