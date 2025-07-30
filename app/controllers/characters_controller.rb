class CharactersController < ApplicationController
  def new
    # Renders the form
  end

  def create
    # Get submitted form data
    name = params[:name]
    race = params[:race]

    pdf_path = Rails.root.join("app", "assets", "pdfs", "5E_CharacterSheet_Fillable.pdf")
    doc = HexaPDF::Document.open(pdf_path)

    # Fill PDF fields
    doc.acro_form.each_field do |field|
      case field.full_field_name
      when "CharacterName"
        field.field_value = name
      when "Race "
        field.field_value = race
      end
    end

    # Write PDF to a string (in-memory)
    filled_pdf = StringIO.new
    doc.write(filled_pdf)
    filled_pdf.rewind

    # Send the filled PDF as a download
    send_data filled_pdf.read, filename: "character_sheet_filled.pdf", type: "application/pdf", disposition: "attachment"
  end
end
