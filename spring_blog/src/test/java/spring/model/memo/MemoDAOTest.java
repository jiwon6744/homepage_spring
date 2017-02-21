package spring.model.memo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

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

public class MemoDAOTest {

	private static BeanFactory beans;
	private static MemoDAO mdao;

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
		mdao = (MemoDAO) beans.getBean("mdao");
	}

	@After
	public void tearDown() throws Exception {

	}

	@Test
	@Ignore
	public void testSetSession() {
		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testTotal() {
		assertEquals(mdao.total("title",""),1);
	}

	@Test
	@Ignore
	public void testUpViewcnt() {
		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testUpdate() {
		MemoDTO dto = new MemoDTO();
		dto.setMemono(503);
		dto.setTitle("변경테스트");
		dto.setContent("변경컨텐트");
		assertTrue(mdao.update(dto));
	}

	@Test
	@Ignore
	public void testCreate() {
		fail("Not yet implemented");
	}

	@Test
//	@Ignore
	public void testRead() {
		mdao.upViewcnt(503);
		MemoDTO dto= mdao.read(503);
		assertNotNull(dto);
	}

	@Test
	@Ignore
	public void testList() {
		fail("Not yet implemented");
	}

}
