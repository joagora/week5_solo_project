require("pg")
class SqlRunner
  def self.run sql, values = []
    begin
      db = PG.connect({ dbname: 'dfbb3ov9bc1ari', host: 'ec2-107-22-221-60.compute-1.amazonaws.com',
      port: 5432, user: 'ytpngekeemrfaq', password: '2b71eb821018f91098e6292ade63919c7d290db446a37c04b61c78789fa4c7eb'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close if db
    end
    return result
  end
end


PG.connect( {dbname: 'dasdkdsaldkj',
host: 'ec2-1-1-1-1-1.compute-1.amazonaws.com',
port: 5432, user: 'nsdlkdjalskjd', password: 'sadlskjadlkjASDAD'})
