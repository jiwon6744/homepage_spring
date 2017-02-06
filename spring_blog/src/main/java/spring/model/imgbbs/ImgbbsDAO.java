package spring.model.imgbbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImgbbsDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Map imgRead(int no) {
		return sqlSession.selectOne("imgbbs.imgRead", no);
	}

	public boolean chechRefno(int no) {
		boolean flag = false;
		int cnt = sqlSession.selectOne("imgbbs.checkRefno", no);
		if (cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean passCheck(Map map) {
		boolean flag = false;
		int cnt = sqlSession.selectOne("imgbbs.passCheck", map);
		if (cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean delete(int no) {
		boolean flag = false;
		int cnt = sqlSession.delete("imgbbs.delete", no);
		if (cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean update(ImgbbsDTO dto) {
		boolean flag = false;
		int cnt = sqlSession.update("imgbbs.update", dto);
		if (cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public ImgbbsDTO readReply(int no) {
		return sqlSession.selectOne("imgbbs.readReply", no);

	}

	public boolean createreply(ImgbbsDTO dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("imgbbs.createreply", dto);
		if (cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public void addAnsnum(Map map) {
		sqlSession.update("imgbbs.addAnsnum", map);
	}

	public ImgbbsDTO read(int no) {
		return sqlSession.selectOne("imgbbs.read", no);
	}

	public int total(String col, String word) {
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return sqlSession.selectOne("imgbbs.total", map);
	}

	public void upViewcnt(int no) {
		sqlSession.update("imgbbs.upViewcnt", no);
	}

	public List<ImgbbsDTO> list(Map map) {
		return sqlSession.selectList("imgbbs.list", map);
	}

	public boolean create(ImgbbsDTO dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("imgbbs.create", dto);
		if (cnt > 0) {
			flag = true;
		}
		return flag;
	}
}
