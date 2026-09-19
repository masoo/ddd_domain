require "minitest/autorun"
require "tmpdir"
require "rails/generators"
require "rails/generators/test_case"
require "ddd_domain"
require "generators/domain_result/domain_result_generator"

class DomainResultGeneratorTest < Rails::Generators::TestCase
  tests DomainResultGenerator
  # Generate into the system temp dir so that nothing is left in the repository.
  destination File.join(Dir.tmpdir, "ddd_domain_generator_test")
  setup :prepare_destination
  teardown { rm_rf(destination_root) }

  test "creates the initializer with the assignment commented out" do
    run_generator

    assert_file "config/initializers/domain_result.rb" do |content|
      assert_match(/^# DomainResult = DddDomain::DomainResult$/, content)
      assert content.lines.all? { |line| line.start_with?("#") }, "expected every line to be a comment"
    end
  end

  # The descriptions are commented out twice, so that they stay comments when
  # the whole file is uncommented with the toggle comment feature of an editor.
  test "only the assignment becomes code once the whole file is uncommented" do
    run_generator

    assert_file "config/initializers/domain_result.rb" do |content|
      uncommented = content.gsub(/^# ?/, "")
      code = uncommented.lines.map(&:strip).reject { |line| line.empty? || line.start_with?("#") }

      assert_equal ["DomainResult = DddDomain::DomainResult"], code

      namespace = Module.new
      namespace.module_eval(uncommented)

      assert_same DddDomain::DomainResult, namespace::DomainResult
    end
  end
end
