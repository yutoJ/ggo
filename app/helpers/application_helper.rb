module ApplicationHelper

  def avatar_url(user)
    if !user.local_image.blank?
      user.local_image
    elsif user.sns_image
      "http://graph.facebook.com/#{user.uid}/picture?type=large"
    #elsif
    #  gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    #  "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    else
      "person.png"
    end
  end

  def date_japan(time)
    time.strftime("%Y-%m-%d")
  end
end
