require 'sprockets'
require 'sprockets/engines'
require 'require-everything/handlebars_template'
require 'require-everything/less_template'

module RequireEverything
  class Engine < Rails::Engine
  end

  Sprockets.register_engine '.rehandlebars', HandlebarsTemplate
  Sprockets.register_engine '.reless', LessTemplate
end
