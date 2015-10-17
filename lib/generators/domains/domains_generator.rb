class DomainsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_initializer_file
    empty_directory "app/domains/#{file_name}"
    create_file "app/domains/#{file_name}/.keep"
    inject_into_file 'config/application.rb', :before => "  end\nend" do
    <<-"RUBY"

    # Configure load paths for DDD domain #{file_name}
    config.autoload_paths += %W(\#{config.root}/app/domains/#{file_name})
    RUBY
    end
  end
end
