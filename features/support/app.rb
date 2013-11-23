module AppSpecHelpers

  def table_at(selector)
    Nokogiri::HTML(page.body).css(selector).map do |table|
      table.css('tr').map do |tr|
        tr.css('td').map { |td| td.text }
      end
    end[0].reject(&:empty?)
  end

end

World(AppSpecHelpers)
World(FactoryGirl::Syntax::Methods)