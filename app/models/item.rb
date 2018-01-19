class Item < ApplicationRecord
  has_attached_file :picture,
                  styles: { thumb: ["150x150#", :jpg],
                  original: ['500x500>', :jpg] },
                  default_url: "/images/:style/missing.png",
                  convert_options: { thumb: "-quality 75 -strip",
                                     original: "-quality 100 -strip" }

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
    self.update(url: "https://shwop-api.herokuapp.com/system/items/pictures/000/000/#{url_number}/original/#{file_name}")
  end

  def add_key
    self.key = self.id
  end



end
