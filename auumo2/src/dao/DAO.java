package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	static DataSource ds;

	public Connection getConnection() throws Exception{
		if(ds == null) {
			InitialContext ic = new InitialContext();
			ds = (DataSource)ic.lookup("java:/comp/env/jdbc/auumo");
		}
		return ds.getConnection();
	}

	public void closeConnetcion(PreparedStatement ps,Connection con) throws Exception {

		ps.close();
		con.getAutoCommit();
        con.close();
	}
}
