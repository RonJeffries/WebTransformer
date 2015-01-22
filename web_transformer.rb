class WebTransformer
  def hookup
    4
  end

  def process(text)
    @output = text
    @output = make_asset_links_local(@output)
    @output
  end

  def make_asset_links_local(input)
    output = input
    output = output.gsub(/src="([^\"]+\/)+([^"]+)?"/,'src="\2"')
    output = output.gsub(/http:\/\/www\.xprogramming\.com/, "")
    output
  end

  def result
    @output
  end

end