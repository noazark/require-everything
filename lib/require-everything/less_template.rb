require 'tilt/template'

module RequireEverything
  # = Sprockets engine for HandlebarsJS templates
  class LessTemplate < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def self.engine_initialized?
      defined? ::Less::Engine
    end

    def initialize_engine
      require_template_library 'less'
    end

    def prepare
      if ::Less.const_defined? :Engine
        @engine = ::Less::Engine.new(data)
      else
        parser  = ::Less::Parser.new(options.merge :filename => eval_file, :line => line)
        @engine = parser.parse(data)
      end
    end

    def evaluate(scope, locals, &block)
      <<-template
define(function (require) {
  var style = module.exports = document.createElement('style');
  style.appendChild(
    document.createTextNode(\"#{@engine.to_css}\");
  );
});
      template
    end
  end
end
