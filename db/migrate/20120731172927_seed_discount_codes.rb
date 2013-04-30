class SeedDiscountCodes < ActiveRecord::Migration
  def up
    [%w[FeoLnqUT6WGCQ	  0   2012-08-31],
     %w[Feuxsy0WxSMfo	  1   2012-08-31],
     %w[FeADaJc21GtxY	  10  2012-08-31],
     %w[FeAWz8hzkBr8w	  19  2012-08-31],
     %w[FenDoERTtdgNQ	  29  2012-08-31],
     %w[FeUXRIdnAPLMc	  39  2012-08-31],
     %w[Fe8FtykQqovWc	  49  2012-08-31],
     %w[FeVftzsogA7is	  59  2012-08-31],
     %w[Fe9zK4zMeC3H.	  69  2012-08-31],
     %w[FezrwWtHdignU	  79  2012-08-31],
     %w[Fe.sLcO.Z69bs	  89  2012-08-31]].each{|d| DiscountCode.create! code: d[0], price: d[1], expiration: d[2]}
  end

  def down
  end
end
