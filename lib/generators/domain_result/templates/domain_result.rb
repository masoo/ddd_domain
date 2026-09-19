# # DddDomain::DomainResult is a value object that represents the outcome of a
# # domain layer operation. It is defined in the ddd_domain gem, not in this
# # application:
# #
# #   https://github.com/masoo/ddd_domain/blob/main/lib/ddd_domain/domain_result.rb
# #
# # Run `bundle open ddd_domain` to read the source installed in this application.
# #
# #   result = DddDomain::DomainResult.success
# #   result = DddDomain::DomainResult.failure("The order is already shipped")
# #   result = DddDomain::DomainResult.failure(exception: e)
# #
# #   result.success?  # => true if the operation succeeded
# #   result.failure?  # => true if the operation failed
# #   result.message   # => the reason a business rule was violated
# #   result.exception # => the original exception behind an unexpected failure
# #
# # Uncomment the following line to refer to it as DomainResult, without the
# # DddDomain:: prefix, anywhere in this application.
#
# DomainResult = DddDomain::DomainResult
