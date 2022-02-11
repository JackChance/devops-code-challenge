# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'lf_eval_server'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'lf_eval_server::default', 'lf_eval_server::backend', 'lf_eval_server::frontend'

# Specify a custom source for a single cookbook:
cookbook 'lf_eval_server', path: '.'
cookbook 'nodejs', '~> 9.0.1', :supermarket

# Attributes to adjust cookbook behavoir
root = default['lf_eval_server']
root['frontend_home'] = '/frontend'
root['backend_home'] = '/backend'
