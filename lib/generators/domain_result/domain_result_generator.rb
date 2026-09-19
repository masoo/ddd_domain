class DomainResultGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def create_initializer_file
    copy_file "domain_result.rb", "config/initializers/domain_result.rb"
  end
end
