require 'aws-sdk'
require 'capistrano/autoscale/aws/credentials'

module Capistrano
  module Autoscaling
    module Aws
      module AutoScaling
        include Capistrano::Autoscaling::Aws::Credentials
        include Capistrano::DSL

        def autoscaling
          @autoscaling ||= ::Aws::AutoScaling::Client.new(credentials)
        end

        def autoscale_group
          @autoscale_group ||= autoscaling.describe_auto_scaling_groups({auto_scaling_group_names: [autoscale_group_name]}).auto_scaling_groups.first
        end

        def autoscale_group_name
          fetch(:aws_autoscale_group)
        end

      end
    end
  end
end