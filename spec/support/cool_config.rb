# frozen_string_literal: true

class CoolConfig < Anyway::Config # :nodoc:
  config_name :cool
  attr_config :meta,
    :data,
    port: 8080,
    host: "localhost",
    user: {name: "admin", password: "admin"}

  coerce_types host: :string, user: {dob: :date}

  attr_description meta: "Meta information about Cool",
                   port: "Port to run CoolServer on"
end
