packages = [
  'nodejs',
]

packages.each do |name|
  describe package(name) do
    it { should be_installed }
  end
end
