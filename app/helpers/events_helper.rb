module EventsHelper
  def not_post_yet(event, current_user)
    !!current_user && !EventReport.exists?({user: current_user, event: event})
  end

  def posted_report_id(event, current_user)
    if !current_user
      return nil
    end

    found = EventReport \
      .where("user_id = :u and event_id = :e", {u: current_user.id, e: event.id}).first

    found && found.id
  end

  def oneline_summary(event)
    "%s (%s)" % [event.name, event.event_date.strftime('%d %B, %Y')]
  end

  module_function :not_post_yet, :posted_report_id, :oneline_summary
end
