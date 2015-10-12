module EventReportsHelper
  def reports_grid(reports)
    content_tag(:div, class: "grid bgh-event-reports-grid col-lg-12") do
        reports.collect { |report|
          render(partial: 'event_reports/event_report', object: report)
        }.join.html_safe
    end
  end
end
