package spring.model.team;

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
public class TeamDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public boolean create(TeamDTO dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("team.create", dto);
		if(cnt > 0){
			flag = true;
		}
		return flag;
	}

	public TeamDTO read(int teamno) {
		return sqlSession.selectOne("team.read", teamno);
	}

	public boolean update(TeamDTO dto) {
		boolean flag = false;
		int cnt = sqlSession.update("team.update", dto);
		if(cnt > 0){
			flag = true;
		}
		return flag;
	}

	public boolean delete(int teamno) {
		boolean flag = false;
		int cnt =  sqlSession.delete("team.delete", teamno);
		if(cnt > 0 ){
			flag = true;
		}
		return flag;
	}

	public List<TeamDTO> list(Map map) {

		return sqlSession.selectList("team.list", map);
	}

	public int total(String col, String word) {
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return sqlSession.selectOne("team.total", map);
	}

	public boolean updateFile(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		String filename = (String) map.get("filename");
		int teamno = (Integer) map.get("teamno");
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE teamInfo ");
		sql.append(" SET filename = ? ");
		sql.append(" WHERE teamno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, filename);
			pstmt.setInt(2, teamno);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}
}
