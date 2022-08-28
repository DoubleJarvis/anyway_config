desc "Generate ENVIRONMENT.md with available config attributes, their defaults and descriptions (if available)"
namespace :anyway_config do
  task :describe_environment do
    puts Anyway::Config.name.to_s
  end
end
