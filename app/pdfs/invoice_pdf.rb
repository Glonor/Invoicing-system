include ActionView::Helpers::NumberHelper
class InvoicePdf < Prawn::Document
  def initialize(invoice, view)
    super(top_margin: 70)
    @invoice = invoice
    @view = view
    invoice_number
    line_items
    total_price
  end

  def invoice_number
    text "Invoice \##{@invoice.id}", size: 30, style: :bold
  end

  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..5).align = :right
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
    end
  end

  def line_item_rows
    [["Title", "Description", "Start time", "End time", "Price"]] +
        @invoice.services.map do |item|
          [item.title, item.description, item.start_time.to_s, item.end_time.to_s, price(item.amount)]
        end
  end

  def total_price
    move_down 15
    text "Total Price: #{price(@invoice.total_amount)}", size: 16, style: :bold
  end

  private

  def price(n)
    @view.number_to_currency(n)
  end
end