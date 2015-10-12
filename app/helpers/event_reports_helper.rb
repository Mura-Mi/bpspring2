module EventReportsHelper
  def reports_grid(reports, show_event_info = false)
    content_tag(:div, class: "grid bgh-event-reports-grid col-lg-12") do
        reports.collect { |report|
          render(partial: 'event_reports/event_report', object: report, locals: {show_event_info: show_event_info})
        }.join.html_safe
    end
  end
end
