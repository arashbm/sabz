module RequestsHelper
  def request_state_with_label request
    content_tag :span, request_state(request), class: "label label-#{request_state_class(request)}"
  end

  def request_state request
    t("activerecord.values.request.state.#{request.state}")
  end

  def request_state_class request
    t("activerecord.values.request.state_class.#{request.state}")
  end
end
