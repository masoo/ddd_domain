require "minitest/autorun"
require "ddd_domain"

class DddDomain::DomainResultTest < Minitest::Test
  def test_success_builds_a_successful_result
    result = DddDomain::DomainResult.success

    assert result.success?
    refute result.failure?
    assert_nil result.message
    assert_nil result.exception
  end

  def test_failure_without_arguments_builds_a_failed_result
    result = DddDomain::DomainResult.failure

    assert result.failure?
    refute result.success?
    assert_nil result.message
    assert_nil result.exception
  end

  def test_failure_keeps_the_message
    result = DddDomain::DomainResult.failure("The order is already shipped")

    assert result.failure?
    assert_equal "The order is already shipped", result.message
    assert_nil result.exception
  end

  def test_failure_keeps_the_exception
    error = StandardError.new("boom")
    result = DddDomain::DomainResult.failure(exception: error)

    assert result.failure?
    assert_nil result.message
    assert_same error, result.exception
  end

  def test_results_are_compared_by_value
    assert_equal DddDomain::DomainResult.success, DddDomain::DomainResult.success
    assert_equal DddDomain::DomainResult.failure("error"), DddDomain::DomainResult.failure("error")
    refute_equal DddDomain::DomainResult.success, DddDomain::DomainResult.failure
  end

  def test_results_are_immutable
    assert DddDomain::DomainResult.success.frozen?
  end
end
