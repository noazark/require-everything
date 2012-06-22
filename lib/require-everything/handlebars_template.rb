require 'tilt/template'

module RequireEverything
  # = Sprockets engine for HandlebarsJS templates
  class HandlebarsTemplate < Tilt::Template
    def self.default_mime_type
      'application/javascript'
    end

    def initialize_engine
    end

    def prepare
    end

    # Generates Javascript code from a HandlebarsJS template.
    # The template name is derived from the lowercase logical asset path
    # by replacing non-alphanum characheters by underscores.
    def evaluate(scope, locals, &block)
      template = data.dup
      template.gsub!(/"/, '\\"')
      template.gsub!(/\r?\n/, '\\n')
      template.gsub!(/\t/, '\\t')
      <<-template
define([], function (require) {
  return Handlebars.compile(\"#{template}\");
});
      template
    end
  end
end
