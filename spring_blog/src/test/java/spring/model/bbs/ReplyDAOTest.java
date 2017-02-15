package spring.model.bbs;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ReplyDAOTest {
	private static BeanFactory beans;
	private static ReplyDAO dao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("blog.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		dao = (ReplyDAO) beans.getBean("rdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testRcount() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testCreate() {

		ReplyDTO dto = new ReplyDTO();
		dto.setBbsno(3);
		dto.setContent("댓글1");
		dto.setId("user1");
		assertTrue(dao.create(dto));
	}

	@Test @Ignore
	public void testRead() {
		ReplyDTO dto = dao.read(10);
		assertNotNull(dto);
	}
 
	@Test @Ignore
	public void testUpdate() {
		ReplyDTO dto = new ReplyDTO();

		dto.setContent("댓글2");

		dto.setRnum(11);
		assertTrue(dao.update(dto));
	}

	@Test @Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("bbsno", 29);
		map.put("sno", 1);
		map.put("eno", 5);
		List<ReplyDTO> list = dao.list(map);
		assertEquals(list.size(), 1);
	}

	@Test @Ignore
	public void testTotal() {
		int bbsno = 10;
		int cnt = dao.total(bbsno);
		assertEquals(cnt,1);
	}

	@Test @Ignore
	public void testDelete() {
		int rnum  = 3;
		assertTrue(dao.delete(rnum));
	}

	@Test
	public void testBdelete() throws Exception {
		int bbsno = 2;
		assertEquals(dao.bdelete(bbsno),1);
	}

}
