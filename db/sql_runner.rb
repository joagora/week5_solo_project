require("pg")
class SqlRunner
  def self.run sql, values = []
    begin
      db = PG.connect({ dbname: 'd4s56hc92s1p09', host: 'ec2-107-22-221-60.compute-1.amazonaws.com
',
      port: 5432, user: 'cckljvuailjgcz', password: '56e4ed0c057f1d839a9024b934995f7f8648a04d4572e26a86863162efe6793b'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close if db
    end
    return result
  end
end
