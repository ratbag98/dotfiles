Pry.config.editor = "gvim --nofork" 

# loading rails configuration if it is running as a rails console
load '~/.railsrc' if defined?(Rails) && Rails.env
