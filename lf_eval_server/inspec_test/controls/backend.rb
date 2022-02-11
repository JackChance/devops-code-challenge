describe port(8080) do
  it {should be_listening}
end

npm_packages ={
  'express' => '4.17.1',
  'uuid' => '8.3.2',
}

npm_packages.each do |name, version|
  describe npm(name, path: '/backend') do
    it {should be_installed}
    its('version') {should eq (version)}
  end
end