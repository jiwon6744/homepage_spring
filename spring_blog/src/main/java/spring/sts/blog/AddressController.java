package spring.sts.blog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.address.AddressDAO;
import spring.model.address.AddressDTO;
import spring.utility.blog.Utility;

@Controller
public class AddressController {

	@Autowired
	private AddressDAO dao;

	@RequestMapping(value = "/address/delete", method = RequestMethod.GET)
	public String delete(int no, Model model, String nowPage, String word, String col){
		boolean flag = dao.delete(no);
		if(flag){
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("word", word);
			model.addAttribute("col", col);
			return "redirect:./list";
		}else{
			return "error";
		}
	}
	@RequestMapping(value = "/address/update", method = RequestMethod.POST)
	public String update(int no, AddressDTO dto, String nowPage, String word, String col, Model model) {
		boolean flag = dao.update(dto);
		if(flag){
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("word", word);
			model.addAttribute("col", col);
			return "redirect:./list";
		}else{
			return "error";
		}
	}

	@RequestMapping(value = "/address/update", method = RequestMethod.GET)
	public String update(int no, Model model) {
		AddressDTO dto = dao.read(no);
		model.addAttribute("dto", dto);
		return "/address/update";
	}

	@RequestMapping("/address/read")
	public String read(int no, String nowPage, String word, String col, Model model) {
		AddressDTO dto = dao.read(no);
		model.addAttribute("dto", dto);
		return "/address/read";

	}

	@RequestMapping(value = "/address/create", method = RequestMethod.POST)
	public String create(AddressDTO dto, String nowPage, String word, String col, Model model) {
		if (dao.create(dto)) {
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("word", word);
			model.addAttribute("col", col);
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/address/create", method = RequestMethod.GET)
	public String create() {
		return "/address/create";
	}

	@RequestMapping("/address/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}
		// 검색end
		// 페이지 관련 ----------------`--------------
		int nowPage = 1; // 현재 페이지(변경가능해야함))
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 5; // 현 페이지당 보여줄 레코드 갯수

		// DB에서 읽어줄 시작순번과 끝순번 생성
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		// 검색에 대한 데이터를 리스트에가서 뽑아와야함.
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		// sql.append(" SELECT memono, title, to_char(wdate, 'yyyy-mm-dd') as
		// wdate, viewcnt ");
		// sql.append(" FROM memo ");
		// sql.append(" ORDER BY memono DESC ");

		// pstmt = con.prepareStatement(sql.toString()); // 전송객체 + 쿼리문

		// rs = pstmt.executeQuery(); // SELECT 는 ResultSet으로 받는다. 데이터를 다 받는다.
		List<AddressDTO> list = dao.list(map);
		int total = dao.total(col, word);

		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		return "/address/list";
	}
}
