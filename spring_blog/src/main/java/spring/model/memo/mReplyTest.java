package spring.model.memo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class mReplyTest {

	public static void main(String[] args) {
		Resource resource = new ClassPathResource("mblog.xml");

		BeanFactory beans = new XmlBeanFactory(resource);

		mReplyDAO dao = (mReplyDAO) beans.getBean("rdao");

		// create(dao);
		// read(dao);
		// update(dao);
		// list(dao);
		// delete(dao);
		// total(dao);

	}

	private static void total(mReplyDAO dao) {
		int memono = 1;
		int total = dao.total(memono);
		p("total:" + total);

	}

	private static void delete(mReplyDAO dao) {

		if (dao.delete(1)) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void list(mReplyDAO dao) {
		int sno = 1;
		int eno = 5;
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("memono", 1);

		List<mReplyDTO> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			mReplyDTO dto = list.get(i);

			p(dto);
			p("-------------------");
		}

	}

	private static void update(mReplyDAO dao) {
		mReplyDTO dto = dao.read(1);
		dto.setContent("댓글 내용을 변경합니다.");

		if (dao.update(dto)) {
			p("성공");
			dto = dao.read(1);
			p(dto);
		} else {
			p("실패");
		}

	}

	private static void read(mReplyDAO dao) {
		mReplyDTO dto = dao.read(1);
		p(dto);

	}

	private static void p(mReplyDTO dto) {
		p("번호:" + dto.getRnum());
		p("내용:" + dto.getContent());
		p("아이디:" + dto.getId());
		p("글번호:" + dto.getMemono());
		p("등록날짜:" + dto.getRegdate());

	}

	private static void create(mReplyDAO dao) {

		mReplyDTO dto = new mReplyDTO();
		dto.setId("user2");// member table에서 id가져오기
		dto.setContent("댓글 쓰기 예제");
		dto.setMemono(1);// memo table에서 존재하는 글번호 가져오기
		if (dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void p(String string) {
		System.out.println(string);

	}

}