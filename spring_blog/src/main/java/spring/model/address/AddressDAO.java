package spring.model.address;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		int cnt = sqlSession.update("address.update", dto);
		if(cnt > 0){
			flag = true;
		}
		return flag;
	}

	public boolean delete(int no) {
		boolean flag = false;
		int cnt = sqlSession.delete("address.delete",no);
		if(cnt > 0){
			flag = true;
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
