# Establish variable for ease of access
root = node['lf_eval_server']
# Create home directory
directory root['backend_home']

files_list = [
  'package-lock.json',
  'config.js',
  'index.js',
  'package.json',
]

files_list.each do |path|
  cookbook_file "#{root['backend_home']}/#{path}" do
    source "backend/#{path}"
  end
end

npm_package 'backend packages' do
  path node['lf_eval_server']['backend_home']
  json true
end

bash 'npm start' do
  cwd root['backend_home']
  code 'npm start &'
  not_if "sudo ps ax | grep 'npm start' |grep -o '^[^ ]*' | xargs -l pwdx | grep -m1 #{root['backend_home']}"
end