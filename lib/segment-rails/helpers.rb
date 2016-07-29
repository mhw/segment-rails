require 'json'

module SegmentRails
  module Helpers
    def user_identifier
      nil
    end

    def track_alias_event(uuid)
      analytics_alias = cookies[:analytics_alias] ? JSON.parse(cookies[:analytics_alias]) : {}
      analytics_alias[:uuid] = uuid if uuid
      cookies[:analytics_alias] = JSON.dump(analytics_alias)
    end

    def track_event(event_name, properties={})
      analytics = cookies[:analytics] ? JSON.parse(cookies[:analytics]) : {}
      analytics[:uuid] = user_identifier if user_identifier
      analytics[:events] ||= []
      analytics[:events].push({ name: event_name, properties:  properties})
      cookies[:analytics] = JSON.dump(analytics)
    end
  end
end
