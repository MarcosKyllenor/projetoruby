module ApplicationHelper
    def display_notice(notice)
        if notice.present?
          content_tag(:div, notice, class: "alert alert-success")
        end
    end

    def person_status_icon(person)
      if person.active
        content_tag(:span, class: 'text-success') do
          content_tag(:i, nil, class: 'bi bi-check-circle')
        end
      else
        content_tag(:span, class: 'text-danger') do
          content_tag(:i, nil, class: 'bi bi-x-circle')
        end
      end
    end
end
