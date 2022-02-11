# lf_eval_server

Public example site at http://18.188.189.147:3000

## Creating a node

Follow the quickstart EC2 wizard in the AWS console

Ensure that the security group has port 3000 open either by editing the sg during the creation process or right clicking your instance, selecting security and adding it in.

Bootstrap the node with
`sudo curl -L https://omnitruck.chef.io/install.sh | sudo bash`

## Applying this code

Move the .tgz file, located under `lf_eval_server/packages`, to the target node. 

Unpack from your desired location with the command
`tar -xvf {path to .tgz}`

then execute
`sudo chef-client -z` from the directory it was unpacked to. The first execution will require you to accept the Chef license by typing 'yes' on the next prompt.

## Integration testing

`inspec_test/controls` lives in the same directory as the tgz file was unpacked, under `cookbook_artifacts/lf_eval_server-#{policy number}/inspec_test/controls}`

Run `/opt/chef/bin/inspec exec #{path to inspec_test/controls}` to execute the tests

## Updating this code

Make changes as desired to the files within lf_eval_server

To generate the installation artifact run the following commands in the root level of this directory on a Chef workstation
`chef update`
`chef export -a ./Policyfile.rb ../packages`

This will generate a policyfile tgz in `../packages` starting with the name lf-eval-server-.


## Next steps

To  improve the deploy experience the following should be done

1. Generalize installation steps in an Custom Resource to handle backend and frontend with a single block of code and inputs.
2. Wrap the bootstrap command in a Jenkins job
3. Create a Terraform plan to handle the AWS server creation
4. Store cannonical Policyfile artifact somewhere accessible to Jenkins server, such as Artifactory
5. Wrap the move-untar-execute commands in Jenkins job
6. Templatize the frontend/src/config.js and backend/config.js to accept variables for URL to allow multiple server configurations

