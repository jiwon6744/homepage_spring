package spring.model.team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;

@Repository
public class TeamDAO {
	public boolean create(TeamDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO teamInfo ");
		sql.append(" (teamno, name, gender, phone, zipcode, address1, address2, skill, hobby, filename) ");
		sql.append(" VALUES ((SELECT NVL(MAX(teamno),0)+1 FROM teamInfo),? ,?, ?, ?, ?, ?, ?, ?, ?) ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getZipcode());
			pstmt.setString(5, dto.getAddress1());
			pstmt.setString(6, dto.getAddress2());
			pstmt.setString(7, dto.getSkillstr());
			pstmt.setString(8, dto.getHobby());
			pstmt.setString(9, dto.getFilename());
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

	public TeamDTO read(int teamno) {
		TeamDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM teamInfo ");
		sql.append(" WHERE teamno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, teamno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new TeamDTO();
				dto.setTeamno(rs.getInt("teamno"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setPhone(rs.getString("phone"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setSkillstr(rs.getString("skill"));
				/* 여기서 skill에 저장을 할 수 없다 디비에서 불러올때는 DTO 에 있는 skill에는 값이 없다. */
				/*
				 * 단순히 DB에서 select한 결과를 jsp에 출력될때는 DTO 에 있는 skillstr 에 있는 코드를 쓸
				 * 필요가 없다
				 */
				dto.setHobby(rs.getString("hobby"));
				dto.setFilename(rs.getString("filename"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	}

	public boolean update(TeamDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE teamInfo ");
		sql.append(" SET phone = ?, zipcode = ?, address1 = ?, address2 = ?, skill = ?, hobby = ?");
		if (dto.getFilename().trim().length() > 0) {
			sql.append(" ,filename = ? ");
		}
		sql.append(" WHERE teamno = ? ");
		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++i, dto.getPhone());
			pstmt.setString(++i, dto.getZipcode());
			pstmt.setString(++i, dto.getAddress1());
			pstmt.setString(++i, dto.getAddress2());
			pstmt.setString(++i, dto.getSkillstr());
			pstmt.setString(++i, dto.getHobby());
			if (dto.getFilename().trim().length() > 0) {
				pstmt.setString(++i, dto.getFilename());
			}
			pstmt.setInt(++i, dto.getTeamno());

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

	public boolean delete(int teamno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" DELETE FROM teamInfo ");
		sql.append(" WHERE teamno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, teamno);
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

	public List<TeamDTO> list(Map map) {
		List<TeamDTO> list = new ArrayList<TeamDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT teamno, name, phone, skill, filename, r");
		sql.append(" FROM(");
		sql.append(" 	SELECT teamno, name, phone, skill, filename, rownum r");
		sql.append(" 	FROM(");
		sql.append(" 		SELECT teamno, name, phone, skill, filename ");
		sql.append(" 		FROM teamInfo ");
		if (word.trim().length() > 0)
			sql.append(" 	WHERE " + col + " LIKE '%'||?||'%' ");
		sql.append(" 		ORDER BY teamno desc ");
		sql.append(" 		)");
		sql.append(" 	)WHERE r >=? and r <= ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 1;
			if (word.trim().length() > 0) {
				pstmt.setString(i++, word);
			}
			pstmt.setInt(i++, sno);
			pstmt.setInt(i++, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				TeamDTO dto = new TeamDTO();
				dto.setTeamno(rs.getInt("teamno"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setSkillstr(rs.getString("skill"));
				dto.setFilename(rs.getString("filename"));

				list.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return list;
	}

	public int total(String col, String word) {

		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(*) ");
		sql.append(" FROM teamInfo");
		if (word.trim().length() > 0)
			sql.append(" WHERE " + col + " LIKE '%'||?||'%' ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(1, word);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return total;
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
