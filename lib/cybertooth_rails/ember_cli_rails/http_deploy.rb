module CybertoothRails
  module EmberCliRails
    # Using `ember-cli-rails` gem you can serve your Ember application(s) pre-compiled `index.html`.
    # This class's `index_html` method must return the SPA's html file; in this case it will be a
    # file pulled from an AWS S3 container.
    #
    # spa_http_index_html_path: <%= ENV['SPA_HTTP_INDEX_HTML_PATH'] %>
    #
    # The following redis example gave me the idea to use this technique.
    # @see https://github.com/seanpdoyle/ember-cli-rails-deploy-redis/blob/master/lib/ember_cli/deploy/redis.rb
    class HttpDeploy < LocalFileDeploy
      def index_html
        # TODO: http this
        open(Rails.root.join('public/_index.html')).read
      end
    end
  end
end
