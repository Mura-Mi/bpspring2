module EventReportsHelper
  def reports_grid(reports, show_event_info = false, additional_class = '')
    reports.collect { |report|
      render(partial: 'event_reports/event_report', object: report, locals: {show_event_info: show_event_info, additional_class: additional_class})
    }.join.html_safe
  end

  def report_oneline_summary(report)
    "#{report.summary} (#{report.event.name})"
  end
end
