require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'd6fi4flidqnlsc', host: 'ec2-107-21-99-237.compute-1.amazonaws.com', port: 5432, user: 'lfyjcfptoylsnj', password: '47d257357b8e74c504ff42a7475400502010cd909372e172fd069088a52cc491'})
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
