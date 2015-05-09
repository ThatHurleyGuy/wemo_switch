require 'spec_helper'

describe Wemo do
  let(:wemo) { Wemo.new("192.168.1.150") }

  it "can get a light's status" do
    state = wemo.get_state

    expect([true, false]).to include(state)
  end

  it "can change the state" do
    expect do
      wemo.toggle_outlet
    end.to change { wemo.get_state }
  end

  it "will try multiple ports" do
    allow_any_instance_of(Savon::Client).to receive(:call).and_raise(Net::ReadTimeout)
    expect_any_instance_of(Wemo).to receive(:_outlet_endpoint).with(49151).and_return("http://192.168.1.150:49151")
    expect_any_instance_of(Wemo).to receive(:_outlet_endpoint).with(49153).and_return("http://192.168.1.150:49153")
    expect_any_instance_of(Wemo).to receive(:_outlet_endpoint).with(49154).and_return("http://192.168.1.150:49154")

    expect do
      wemo.toggle_outlet
    end.to  raise_error
  end
end
