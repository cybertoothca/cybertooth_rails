module CybertoothRails
  # This error class will typically be raised when:
  # 1. A user fails to authenticate
  # 2. A request is missing an expected JWT
  # 3. A request's JWT cannot be decoded
  class NotAuthenticatedError < StandardError
    def initialize
      super('Not Authenticated')
    end
  end
end
