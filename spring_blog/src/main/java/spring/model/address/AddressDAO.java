package spring.model.address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;

@Repository
public class AddressDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public boolean create(AddressDTO dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("address.create", dto);
		if(cnt > 0){
			flag = true;
		}
		return flag;
	}

	public AddressDTO read(int no) {
		return sqlSession.selectOne("address.read", no);
	}

	public boolean update(AddressDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE address ");
		sql.append(" SET phone = ?, zipcode = ?, address1 = ?, address2 = ? ");
		sql.append(" WHERE no = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPhone());
			pstmt.setString(2, dto.getZipcode());
			pstmt.setString(3, dto.getAddress1());
			pstmt.setString(4, dto.getAddress2());
			pstmt.setInt(5, dto.getNo());
			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}

	public boolean delete(int no) {
		boolean flag = false;
		AddressDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" DELETE FROM address ");
		sql.append(" WHERE no = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}

	public List<AddressDTO> list(Map map) {
		return sqlSession.selectList("address.list", map);
	}

	public int total(String col, String word) {
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return sqlSession.selectOne("address.total", map);
	}
}
