module DddDomain
  # Value object that represents the outcome of a domain layer operation.
  #
  # Public methods of the domain layer return this object, and the upper
  # layers (GraphQL mutations, jobs, controllers, etc.) convert it into their
  # own idiom (GraphQL::ExecutionError and so on) right where they receive it.
  #
  # - message:   the reason a business rule was violated (meant to be shown to
  #              the user; expected failures only)
  # - exception: the original exception behind an unexpected failure (for
  #              logging and diagnostics; do not branch business logic on it)
  #
  # @example
  #   result = DddDomain::DomainResult.failure("The order is already shipped")
  #   result.failure? # => true
  #   result.message  # => "The order is already shipped"
  DomainResult = Data.define(:success, :message, :exception) do
    # @return [DddDomain::DomainResult] a successful result
    def self.success
      new(success: true, message: nil, exception: nil)
    end

    # @param [String, nil] message the reason a business rule was violated
    # @param [Exception, nil] exception the original exception behind an unexpected failure
    # @return [DddDomain::DomainResult] a failed result
    def self.failure(message = nil, exception: nil)
      new(success: false, message: message, exception: exception)
    end

    # @return [Boolean] true if the operation succeeded
    def success?
      success
    end

    # @return [Boolean] true if the operation failed
    def failure?
      !success
    end
  end
end
