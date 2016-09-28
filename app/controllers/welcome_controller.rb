class WelcomeController < ApplicationController
  def index
    respond_to do |format|
      # Refactor this in order to serve the file directly
      # without creating it on disk
      format.pdf do
        kit = PDFKit.new('http://google.com')
        kit.to_file("#{Rails.root}/public/example.pdf")

        send_file "#{Rails.root}/public/example.pdf",
                  :type => "application/pdf",
                  :file_name => "example.pdf"

        FileUtils.rm("#{Rails.root}/public/example.pdf")
      end
    end
  end

end
