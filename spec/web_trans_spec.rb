require 'rspec'
require_relative '../web_transformer'
require 'nokogiri'

describe "hookup" do
  before :each do
    @wt = WebTransformer.new
  end

  it "should return 4 from hookup" do
    expect(@wt.hookup).to be(4)
  end

  it "should return its input text as modified" do
    @wt.process("This text")
    new_text = @wt.result
    expect(new_text).to eq("This text")
  end
end

describe "transform backlog" do
  before :each do
    @wt = WebTransformer.new
  end

  describe "active work" do
  
    it "should convert an xprogramming URL to not access xprogramming" do
      expect(@wt.process("abc")).to eq("abc")
      expect(@wt.process('abc <img src="http://www.xprogramming.com/uploads/foo/it.jpg"> xyz')).to \
        eq('abc <img src="it.jpg"> xyz')
      expect(@wt.process("abc http://www.xprogramming.com/this/is/it.html xyz")).to \
        eq("abc /this/is/it.html xyz")
      expect(@wt.process("abc http://www.xprogramming.com/this/is/it.htm xyz")).to \
        eq("abc /this/is/it.htm xyz")
    end
  end

  # describe "transformations" do
  # end

  # describe "musts" do
  #   describe "moving articles" do
  #     it "should find all articles"
  #     it "should put them in separate folders"
  #     it "should put all the folders under /ROOT"
  #     it "should (probably, TBD) preserve deeper article structure"
  #   end

  #   describe "assets and links" do
  #     it "should leave external links alone"
  #     it "should leave no links to xprogramming.com"
  #   end

  #   describe "transformations" do
  #     it "should convert 'easy' HTML to KRAMDOWN"
  #     it "should ensure that xprogramming links in articles now point to ronjeffries assets"
  #     it "should handle img links"
  #     it "should handle href links"
  #   end
  # end

  # describe "important" do
  #   describe "transformations" do
  #     it "should convert 'easy' HTML to KRAMDOWN"
  #   end

  #   describe "miscellaneous and/or to be classified" do
  #     it "should support slug-only links (i.e. no file name.html)"
  #   end

  #   describe "assets and links" do
  #     it "should put assets in with articles"
  #   end
  # end

  # describe "nice to have" do
  #   describe "folder structure" do
  #     it "should use a better name than ROOT"
  #   end

  #   describe "transformations" do
  #     it "should flag odd constructs that it cannot deal with"
  #     it "should handle [tables]"
  #   end
  # end

  # describe "probably not" do
  # end

  # describe "to be discussed" do
  #   it "should emit warnings when remote resource files dnt dwnload"
  #   it "should emit warnings when styles appear which aren't defined"
  #   it "should emit warnings when inline styles appear in an article"
  #   it "should emit warnings when a 'local' link is not actually pointing to the WP site"

  #   it "should emit a list of all (internal) links (also by article)"
  #   it "should emit a list of all css styles called (also by article)"
  #   it "should emit a list of all categories/tags applied (also by article)"

  #   it "should point out when the blurb appears within the article already"

  #   it "should not mess up anything inside a CODE block accidentally"
  # end

  # describe "to be continued"

end