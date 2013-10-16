node['sipp']['build_dependencies'].each { |p| package p }

version = node['sipp']['version']

remote_file "#{Chef::Config[:file_cache_path]}/sipp-#{version}.tar.gz" do
  source "http://sourceforge.net/projects/sipp/files/sipp/#{version}/sipp-#{version}.tar.gz"
  checksum "8c1d513423f9dabee799e738b737e311"
end

cookbook_file "#{Chef::Config[:file_cache_path]}/sipp_dyn_pcap.diff" do
  source 'sipp_dyn_pcap.diff'
end

script "compile sipp" do
  interpreter "/bin/bash"
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  tar -xf sipp-#{version}.tar.gz
  cd sipp-#{version}
  patch < ../sipp_dyn_pcap.diff
  make pcapplay
  cp sipp /usr/local/bin
EOF
  not_if do
    system 'sipp'
    $?.exitstatus == 99
  end
end
