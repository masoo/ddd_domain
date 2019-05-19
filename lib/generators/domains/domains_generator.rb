class DomainsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_initializer_file
    empty_directory "app/domains/#{file_name}"
    create_file "app/domains/#{file_name}/.keep"

    if File.exists? "config/initializers/ddd_domain.rb"
      inject_into_file 'config/initializers/ddd_domain.rb', :before => "end" do
        <<-"RUBY"
  config.paths.add 'app/domains/#{file_name}', eager_load: true
        RUBY
      end
    else
      create_file 'config/initializers/ddd_domain.rb' do
        <<~"RUBY"
          Rails.configuration do |config|
            config.paths.add 'app/domains/#{file_name}', eager_load: true
          end
        RUBY
      end
    end
  end
end
