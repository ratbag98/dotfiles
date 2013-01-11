Pry.config.editor = "gvim --nofork" 

%w{hirb}.each { |gem| require gem }

# loading rails configuration if it is running as a rails console
load '~/.railsrc' if defined?(Rails) && Rails.env
