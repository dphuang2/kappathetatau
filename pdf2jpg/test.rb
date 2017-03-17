require 'RMagick'

pdf_file_name = "Resume-photoshop.pdf"

im = Magick::Image.read(pdf_file_name)

im[0].write(pdf_file_name + ".jpg")
