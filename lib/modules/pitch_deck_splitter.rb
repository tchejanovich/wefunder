require 'RMagick'

module PitchDeckSplitter
    UPLOADS_PATH = "#{Rails.root}/app/assets/images/uploads/"

    def split_company_file(company, file_path)
        pdf = Magick::ImageList.new(file_path) do
            self.quality = 100
            self.format = 'JPG'
        end
    
        pdf.each do |page_img|
            pitch_deck_image = PitchDeckImage.create!(company: company)
            filename = "pdi-#{pitch_deck_image.id}.jpg"
            pitch_deck_image.update!(filename: filename)
            page_img.write("#{UPLOADS_PATH}#{filename}")
        end
    end
end