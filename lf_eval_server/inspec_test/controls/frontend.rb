describe port(3000) do
  it { should be_listening }
end

npm_packages = {
  '@testing-library/jest-dom' =>  '5.11.10',
  '@testing-library/react' =>  '11.2.6',
  '@testing-library/user-event' =>  '12.8.3',
  'react' =>  '17.0.2',
  'react-dom' =>  '17.0.2',
  'react-scripts' =>  '4.0.3',
  'web-vitals' =>  '1.1.1',
}

npm_packages.each do |name, version|
  describe npm(name, path: '/frontend') do
    it {should be_installed}
    its('version') {should eq (version)}
  end
end