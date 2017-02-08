package spring.model.memo;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class mReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public boolean create(mReplyDTO dto) {
		boolean flag = false;

		int cnt = (Integer) sqlSessionTemplate.insert("mreply.create", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public mReplyDTO read(int rnum) {

		return (mReplyDTO) sqlSessionTemplate.selectOne("mreply.read", rnum);

	}

	public boolean update(mReplyDTO dto) {
		boolean flag = false;

		int cnt = sqlSessionTemplate.update("mreply.update", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public List<mReplyDTO> list(Map map) {

		return sqlSessionTemplate.selectList("mreply.list", map);
	}

	public int total(int memono) {
		return (Integer) sqlSessionTemplate.selectOne("mreply.total", memono);
	}

	public boolean delete(int rnum) {
		boolean flag = false;
		int cnt = sqlSessionTemplate.delete("mreply.delete", rnum);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	/** 하나의 글의 여러댓글들 삭제 */
	public int bdelete(int memono) throws Exception {
		return sqlSessionTemplate.delete("mreply.bdelete", memono);

	}
}