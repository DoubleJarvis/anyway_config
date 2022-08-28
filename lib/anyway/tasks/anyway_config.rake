desc "Generate ENVIRONMENT.md with available config attributes"
namespace :anyway_config do
  task :describe_environment do
    def descendants(constant)
      ObjectSpace.each_object(Class).select { |klass| klass < constant }
    end

    lines = []

    descendants(Anyway::Config).each do |config_class|
      config_class.config_attributes.each do |config_attribute|
        variable = "#{config_class.env_prefix}_#{config_attribute.to_s.upcase}"
        default_value = config_class.defaults[config_attribute.to_s] || ''
        required = config_class.required.include?(config_attribute) || ''
        description = config_class.attribute_descriptions[config_attribute] || ''

        lines.push("| #{variable} | #{default_value} | #{required} | #{description} |")
      end
    end

    header = "| Variable | Default value | Required | Description |"
    divisor = '| - | - | - | - |'
    markdown = [header, divisor, *lines].join("\n")

    File.write('ENVIRONMENT.md', markdown)
  end
end
