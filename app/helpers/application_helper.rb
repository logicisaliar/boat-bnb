module ApplicationHelper
  def bg_style(boat)
    default = "background-image: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.2))"
    if boat.photo.present?
      bg_url = ", url('#{cl_image_path(b.photo, height: 300, width: 400, crop: :fill)}')"
    else
      bg_url = nil
    end
    return "%{default}#{bg_url}"
  end
end
