require 'segment-rails/version'
require 'segment-rails/helpers'

module SegmentRails
  if const_defined? :Rails
    class Engine < ::Rails::Engine
    end
  end
end
