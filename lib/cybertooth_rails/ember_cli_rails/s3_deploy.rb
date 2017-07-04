module CybertoothRails
  module EmberCliRails
    # Using `ember-cli-rails` gem you can serve your Ember application(s) pre-compiled `index.html`.
    # This class's `index_html` method must return the SPA's html file; in this case it will be a
    # file pulled from an AWS S3 container.
    #
    # spa_s3_bucket_name: <%= ENV['SPA_S3_BUCKET_NAME'] %>
    # spa_s3_region : <%= ENV['SPA_S3_REGION'] %>
    # spa_s3_key: <%= ENV['SPA_S3_KEY'] %>
    # spa_s3_secret : <%= ENV['SPA_S3_SECRET'] %>
    # spa_s3_index_html_path: <%= ENV['SPA_S3_INDEX_HTML_PATH'] %>
    #
    # The following redis example gave me the idea to use this technique.
    # @see https://github.com/seanpdoyle/ember-cli-rails-deploy-redis/blob/master/lib/ember_cli/deploy/redis.rb
    class S3Deploy < LocalFileDeploy
      def index_html
        # TODO: s3 this
        open(Rails.root.join('public/_index.html')).read
      end
    end
  end
end
