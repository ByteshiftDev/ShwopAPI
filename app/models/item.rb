class Item < ApplicationRecord
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  def add_url
    if (self.id.to_s.length) == 1
      url_number = "00" + self.id.to_s
    elsif (self.id.to_s.length) == 2
      url_number = "0" + self.id.to_s
    else
      url_number = self.id.to_s.to_s
    end
    file_name = self.picture_file_name.to_s
    self.update(url: "http://localhost:3000/system/items/pictures/000/000/#{url_number}/original/#{file_name}")
  end

  def test_method
    puts "*****************************************************"
    puts self.name
    puts "*****************************************************"
  end

end
