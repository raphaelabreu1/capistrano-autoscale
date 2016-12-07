require 'aws-sdk'
require 'efsas/aws/credentials'

module Capistrano
  module Autoscale
    module Aws
      module EC2
        include Capistrano::Autoscale::Aws::Credentials

        def ec2_client
          @ec2_client ||= ::Aws::EC2::Client.new(credentials)
        end

        def ec2_instance(instance_id)
          @ec2_instance ||= ::Aws::EC2::Instance.new(instance_id, client: ec2_client)
        end

      end
    end
  end
end