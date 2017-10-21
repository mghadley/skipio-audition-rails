if Rails.env.development?
  begin
    skipio = "#{Rails.root}/config/skipio.yml"
    YAML.load_file(skipio).each do |key, value|
      ENV[key] = value
    end
  rescue
    raise "No skipio.yml config file in your config directory."
  end
end