require 'aws-sdk'

module CybertoothRails
  module EmberCliRails
    # Using `ember-cli-rails` gem you can serve your Ember application(s) pre-compiled `index.html`.
    # This class's `index_html` method will return the Single Page Application's (SPA) html file;
    # in this case it will be a file pulled from a prescribed AWS S3 container.
    #
    # Notice that this is a production-like deploy mechanism; you'd never use this in development or test.
    #
    # Configure the S3 coordinates to your Single Page Application (SPA) index.html file inside
    # your Rails `config/secrets.yml` file.  Obviously sensitive secrets should be passed in as
    # environment variables.  Here is the list of keys you should set inside your `config/secrets.yml`:
    #
    # spa_s3_bucket_name: 'some-bucket-name'
    # spa_s3_region : 'your-region'
    # spa_s3_object_key: 'key-of-s3-object'
    # spa_s3_key: 'user-access-key'
    # spa_s3_secret: 'user-access-key-secret'
    #
    # Now you need to make sure that this class (`CybertoothRails::EmberCliRails::S3Deploy`) is configured
    # inside your `config/initializers/ember.rb`  Here is an example (see the production declaration):
    #
    # ```
    # EmberCli.configure do |c|
    #   c.app :ui, deploy: {
    #       development: CybertoothRails::EmberCliRails::LocalFileDeploy,
    #       production: CybertoothRails::EmberCliRails::S3Deploy,
    #       test: CybertoothRails::EmberCliRails::LocalFileDeploy
    #   }
    # end
    # ```
    #
    # Lastly, make sure your Ember application is mounted inside your `config/routes.rb` file:
    #
    # ```
    # mount_ember_app :ui, to: '/'
    # ```
    #
    # The following redis example gave me the idea to use this technique.
    # @see https://github.com/seanpdoyle/ember-cli-rails-deploy-redis/blob/master/lib/ember_cli/deploy/redis.rb
    class S3Deploy < LocalFileDeploy
      def index_html
        client = Aws::S3::Client.new(
          access_key_id: Rails.application.secrets.spa_s3_key,
          region: Rails.application.secrets.spa_s3_region,
          secret_access_key: Rails.application.secrets.spa_s3_secret
        )
        resource = Aws::S3::Resource.new(client: client)
        resource
          .bucket(Rails.application.secrets.spa_s3_bucket_name)
          .object(Rails.application.secrets.spa_s3_object_key).get.body.read
      end
    end
  end
end
