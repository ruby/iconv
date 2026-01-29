require File.expand_path("../utils.rb", __FILE__)

class TestIconv::Option < TestIconv
  def setup
    begin
      iconv = Iconv.new('SHIFT_JIS', 'EUC-JP')
      iconv.transliterate?
    rescue NotImplementedError
      omit "Iconv option is not implemented"
    end
    @verbose, $VERBOSE = $VERBOSE, nil
  end

  def teardown
    $VERBOSE = @verbose
  end

  def test_ignore_option
    iconv = Iconv.new('SHIFT_JIS', 'EUC-JP//ignore')
    str = iconv.iconv(EUCJ_STR)
    str << iconv.iconv(nil)
    assert_equal(SJIS_STR, str)
    iconv.close

    iconv = Iconv.new('SHIFT_JIS//IGNORE', 'EUC-JP//ignore')
    str = iconv.iconv(EUCJ_STR)
    str << iconv.iconv(nil)
    assert_equal(SJIS_STR, str)
    iconv.close
  end

  def test_translit_option
    iconv = Iconv.new('SHIFT_JIS', 'EUC-JP//ignore')
    str = iconv.iconv(EUCJ_STR)
    str << iconv.iconv(nil)
    assert_equal(SJIS_STR, str)
    iconv.close

    iconv = Iconv.new('SHIFT_JIS//TRANSLIT', 'EUC-JP//translit//ignore')
    str = iconv.iconv(EUCJ_STR)
    str << iconv.iconv(nil)
    assert_equal(SJIS_STR, str)
    iconv.close
  end
end
