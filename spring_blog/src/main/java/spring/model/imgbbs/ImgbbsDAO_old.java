package spring.model.imgbbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.SynchronousQueue;

import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;

@Repository
public class ImgbbsDAO_old {
	public List imgRead(int no) {
		List list = new ArrayList();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM  ");
		sql.append("   (  ");
		sql.append("      select    ");
		sql.append("          lag(no,2)     over (order by no) pre_no2,    ");
		sql.append("          lag(no,1)     over (order by no ) pre_no1,   ");
		sql.append("          no,  ");
		sql.append("          lead(no,1)    over (order by no) nex_no1,    ");
		sql.append("          lead(no,2)    over (order by no) nex_no2,    ");
		sql.append("          lag(filename,2)  over (order by no) pre_file2,     ");
		sql.append("          lag(filename,1)  over (order by no ) pre_file1,  ");
		sql.append("          filename,   ");
		sql.append("          lead(filename,1) over (order by no) nex_file1,  ");
		sql.append("          lead(filename,2) over (order by no) nex_file2   ");
		sql.append("          from (  ");
		sql.append("               SELECT no, filename   ");
		sql.append("               FROM imgbbs ");
		sql.append("               ORDER BY no DESC  ");
		sql.append("          )  ");
		sql.append("   )  ");
		sql.append("   WHERE no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int[] noArr = { rs.getInt("pre_no2"), rs.getInt("pre_no1"), rs.getInt("no"), rs.getInt("nex_no1"),
						rs.getInt("nex_no2") };
				String[] files = { rs.getString("pre_file2"), rs.getString("pre_file1"), rs.getString("filename"),
						rs.getString("nex_file1"), rs.getString("nex_file2") };

				list.add(files);
				list.add(noArr);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return list;
	}

	public boolean chechRefno(int no) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT count(refno) FROM imgbbs ");
		sql.append(" WHERE refno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					flag = true;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public boolean passCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		int no = (Integer) map.get("no");
		String passwd = (String) map.get("passwd");

		sql.append(" SELECT COUNT(no) as cnt");
		sql.append(" FROM imgbbs");
		sql.append(" WHERE no=? AND passwd=?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();
			rs.next();

			int cnt = rs.getInt("cnt");

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return flag;
	}

	public boolean delete(int no) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" DELETE FROM imgbbs");
		sql.append(" WHERE no = ?");

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

	public boolean update(ImgbbsDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE imgbbs ");
		sql.append(" SET name=?, title=?, content=?, ");
		sql.append(" filename=? ");
		sql.append(" WHERE no = ? ");

		try {

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFilename());
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

	public ImgbbsDTO readReply(int no) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		ImgbbsDTO dto = null;

		sql.append(" SELECT no,title,grpno,indent,ansnum ");
		sql.append(" FROM imgbbs");
		sql.append(" WHERE no = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String title = rs.getString("title");
				int grpno = rs.getInt("grpno");
				int indent = rs.getInt("indent");
				int ansnum = rs.getInt("ansnum");

				dto = new ImgbbsDTO();
				dto.setNo(no);
				dto.setTitle(title);
				dto.setGrpno(grpno);
				dto.setIndent(indent);
				dto.setAnsnum(ansnum);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;

	}

	public boolean createreply(ImgbbsDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		System.out.println(dto.toString());
		sql.append(" INSERT INTO imgbbs(no, name, title, ");
		sql.append(" content, passwd, wdate, grpno, indent, ansnum, refno, filename, filesize) ");
		sql.append(" VALUES((SELECT NVL(MAX(no), 0)+ 1 as no FROM imgbbs), ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getGrpno());
			pstmt.setInt(6, dto.getIndent() + 1);
			pstmt.setInt(7, dto.getAnsnum() + 1);
			pstmt.setInt(8, dto.getNo());
			pstmt.setString(9, dto.getFilename());
			pstmt.setInt(10, dto.getFilesize());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public void addAnsnum(Map map) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE imgbbs");
		sql.append(" SET ansnum = ansnum + 1");
		sql.append(" WHERE grpno=? AND ansnum > ?");
		int grpno = (Integer) map.get("grpno");
		int ansnum = (Integer) map.get("ansnum");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
	}

	public ImgbbsDTO read(int no) {
		ImgbbsDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT no, name, title, content, viewcnt, ");
		sql.append(" to_char(wdate, 'yyyy-mm-dd') wdate, filename, filesize");
		sql.append(" FROM imgbbs");
		sql.append(" WHERE no = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next() == true) {

				dto = new ImgbbsDTO(); // 하나의 레코드를 하나의 객체로 변환
				dto.setNo(no);
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize")/1024);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}

	public int total(String col, String word) {
		int total = 0;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT COUNT(*) ");
		sql.append(" FROM imgbbs ");
		if (word.trim().length() > 0)
			sql.append(" WHERE " + col + " like '%' ||?|| '%' ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(1, word);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return total;
	}

	public void upViewcnt(int no) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE imgbbs");
		sql.append(" SET viewcnt = viewcnt + 1");
		sql.append(" WHERE no = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
	}

	public List<ImgbbsDTO> list(Map map) {
		List<ImgbbsDTO> list = new ArrayList<ImgbbsDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		sql.append(" SELECT no, name, title, viewcnt, to_char(wdate, 'yyyy-mm-dd') wdate, filename, indent, r  ");
		sql.append(" FROM(  ");
		sql.append("     SELECT no, name, title, viewcnt, wdate, filename, indent, rownum r  ");
		sql.append("     FROM( ");
		sql.append("      SELECT no, name, title, viewcnt, wdate, filename, indent ");
		sql.append("      FROM imgbbs ");
		if (word.trim().length() > 0) {
			sql.append("  WHERE " + col + " LIKE '%'||?||'%' ");
		}
		sql.append(" 	   ORDER BY grpno DESC, ansnum ASC ) ");
		sql.append("       )  ");
		sql.append("  WHERE r >= ? AND r <= ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			if (word.trim().length() > 0) {
				pstmt.setString(++i, word);
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ImgbbsDTO dto = new ImgbbsDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setFilename(rs.getString("filename"));
				dto.setIndent(rs.getInt("indent"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}

	public boolean create(ImgbbsDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO imgbbs(no, name, title, content, passwd, wdate,  ");
		sql.append(" 					filename, filesize, grpno ) ");
		sql.append(" VALUES((SELECT NVL(MAX(no), 0) + 1 as no FROM imgbbs), ");
		sql.append(" 		?, ?, ?, ?, sysdate, ?, ?,");
		sql.append(" (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM imgbbs)) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getFilename());
			pstmt.setInt(6, dto.getFilesize());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

}
