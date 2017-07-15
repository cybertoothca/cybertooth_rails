module CybertoothRails
  module EmberCliRails
    # Using `ember-cli-rails` gem you can serve your Ember application(s) pre-compiled `index.html`.
    # This class's `index_html` method will return the Single Page Application's (SPA) html file;
    # in this case it will be a file pulled from a prescribed URL.
    #
    # Notice that this is a production-like deploy mechanism; you'd never use this in development or test.
    #
    # Configure the URL coordinates to your Single Page Application (SPA) index.html file inside
    # your Rails `config/secrets.yml` file.
    #
    # spa_http_index_html_path: 'http://example.com/my-spa.html'
    #
    # Now you need to make sure that this class (`CybertoothRails::EmberCliRails::HttpDeploy`) is configured
    # inside your `config/initializers/ember.rb`  Here is an example (see the production declaration):
    #
    # ```
    # EmberCli.configure do |c|
    #   c.app :ui, deploy: {
    #       development: CybertoothRails::EmberCliRails::LocalFileDeploy,
    #       production: CybertoothRails::EmberCliRails::HttpDeploy,
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
    class HttpDeploy < LocalFileDeploy
      def index_html
        open(Rails.application.secrets.spa_http_index_html_path).read
      end
    end
  end
end
