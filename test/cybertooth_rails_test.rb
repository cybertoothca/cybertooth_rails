require 'test_helper'

class CybertoothRailsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CybertoothRails::VERSION
  end

  def test_when_not_authenticated_error
    assert_equal 'Not Authenticated', CybertoothRails::NotAuthenticatedError.new.to_s
  end

  def test_that_local_file_deploy_exists
    refute_nil CybertoothRails::EmberCliRails::LocalFileDeploy.new({})
  end

  def test_that_s3_deploy_exists
    refute_nil CybertoothRails::EmberCliRails::S3Deploy.new({})
  end

  def test_that_s3_deploy_is_not_mountable
    refute CybertoothRails::EmberCliRails::S3Deploy.new({}).mountable?
  end

  def test_that_http_deploy_exists
    refute_nil CybertoothRails::EmberCliRails::HttpDeploy.new({})
  end

  def test_that_http_deploy_is_not_mountable
    refute CybertoothRails::EmberCliRails::HttpDeploy.new({}).mountable?
  end
end
