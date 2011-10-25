require 'labelling_form_builder'
module ApplicationHelper

  def labelled_form_for(name, object, options, &proc)
    form_for(name, object, options.merge(:builder => LabellingFormBuilder), &proc)
  end

  def multipart_form_for(name, object, options, &proc)
    html_options = options.delete(:html) || {}
    html_options.merge!(:multipart => true)
    form_for(name, object, options.merge(:html => html_options), &proc)
  end

  def labelled_multipart_form_for(name, object, options, &proc)
    multipart_form_for(name, object, options.merge(:builder => LabellingFormBuilder), &proc)
  end


end
