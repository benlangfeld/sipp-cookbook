require 'minitest/spec'

describe_recipe 'sipp::default' do
  it "creates a file called sipp.txt" do
    file("/home/vagrant/sipp.txt").must_exist
  end
end
