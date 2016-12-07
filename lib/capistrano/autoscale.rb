require 'aws-sdk'
require 'capistrano/all'
require 'capistrano/dsl'

require 'capistrano/autoscale/version'
require 'capistrano/autoscale/aws/autoscaling_group'
require 'capistrano/autoscale/aws/ec2'

module Capistrano
  module Autoscale
  end
end

def autoscale(groupname, *args)
  include Capistrano::DSL
  include Capistrano::Autoscale::Aws::AutoscalingGroup
  include Capistrano::Autoscale::Aws::EC2

  set :aws_autoscale_group, groupname

  instances = autoscale_group&.instances&.select do |instance|
    instance.lifecycle_state == 'InService'
  end

  instances&.each do |instance|
    hostname = ec2_instance(instance.instance_id).private_ip_address
    p "Autoscale: Deploying to: #{hostname}"
    server(hostname, *args)
  end
end