require 'spec_helper'

describe 'SIPp' do
  describe command('sipp -v') do
    it { should return_stdout /SIPp v3.3-PCAP/ }
  end
end
