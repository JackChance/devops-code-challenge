# Establish variable for ease of access
root = node['lf_eval_server']
# Create home directory
directory root['frontend_home']

# Create directory structure
directory "#{root['frontend_home']}/public"
directory "#{root['frontend_home']}/src"

# define files, must match ./files/#{name} and #{frontend_home}/#{name} format
files_list = [
  'package-lock.json',
  'package.json',
  'public/index.html',
  'public/robots.txt',
  'src/App.css',
  'src/App.js',
  'src/config.js', # Will need to be split into a template if multiserver architecture is desired.
  'src/index.css',
  'src/index.js',
]
# Populate files
files_list.each do |path|
  cookbook_file "#{root['frontend_home']}/#{path}" do
    source "frontend/#{path}"
  end
end

# Install packages defined in provided json files
npm_package 'frontend packages' do
  path node['lf_eval_server']['frontend_home']
  json true
end

# Only attempt to start if it isn't already running
bash 'npm start' do
  cwd root['frontend_home']
  code 'npm start &'
  not_if "sudo ps ax | grep 'npm start' |grep -o '^[^ ]*' | xargs -l pwdx | grep -m1 #{root['frontend_home']}"
end