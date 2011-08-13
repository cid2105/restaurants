class Yelp

  if RAILS_ENV.eql?("development")
   CONSUMER_KEY = "fHxw-I2WocX1BncmlzYyBQ"
   SECRET = "XDOnHAoPcNJiFXbfNxZAdvj_A7g"
   TOKEN = "6WKZE45RHPYcK1a39QjwMaBwxD_v8BO_"
   TOKEN_SECRET = "TeyB5_fl7o3KtSF73j1Gpzl_H7Q"
 else
   CONSUMER_KEY = "oa8kg9SqZxyLkHbwd6W9rg"
   SECRET = "Tr7k1th2pJRCL8QOh686DkVlSqk"
   TOKEN = "7ZC4hwGaez9yL9Bm4tZyNHBDlgzQIfnU"
   TOKEN_SECRET = "EiUowROXZHlu4_zRvS0SjcrVG70"
 end
   
end


