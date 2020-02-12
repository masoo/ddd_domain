class DomainsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_initializer_file
    empty_directory "app/domains/#{file_name}"
    create_file "app/domains/#{file_name}/.keep"
  end
end
