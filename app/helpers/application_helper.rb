module ApplicationHelper
  def submit_or_cancel(form, submit_label="Submit", name="Cancel")
    (form.submit submit_label) + " or " + link_to(name, 'javascript:history.go(-1);', :class => 'cancel')
  end
end
