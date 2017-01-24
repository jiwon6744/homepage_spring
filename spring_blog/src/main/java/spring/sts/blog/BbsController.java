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

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDTO;
import spring.utility.blog.Utility;

@Controller
public class BbsController {
	@Autowired
	private BbsDAO dao;

	@RequestMapping(value = "/bbs/delete", method = RequestMethod.POST)
	public String delete(int bbsno, String passwd, Model model, String oldfile, String col, String word, String nowPage,
			HttpServletRequest request) {
		String upDir = request.getRealPath("/bbs/storage");
		Map map = new HashMap();
		map.put("bbsno", bbsno);
		map.put("passwd", passwd);
		boolean pflag = dao.passCheck(map);
		if (pflag) {
			if (dao.delete(bbsno))
				Utility.deleteFile(upDir, oldfile);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:./list";
		} else {
			return "passwdError";
		}
	}

	@RequestMapping(value = "/bbs/delete", method = RequestMethod.GET)
	public String delete(int bbsno, Model model) {
		model.addAttribute("flag", dao.checkRefno(bbsno));
		return "/bbs/delete";
	}

	@RequestMapping(value = "/bbs/reply", method = RequestMethod.POST)
	public String reply(BbsDTO dto, Model model, String nowPage, String col, String word, HttpServletRequest request) {
		String basePath = request.getRealPath("/bbs/storage");
		int filesize = (int) dto.getFileMF().getSize();
		String filename = "";
		if (filesize > 0) {
			filename = Utility.saveFile(dto.getFileMF(), basePath);
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);

		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		dao.upAnsnum(map);
		System.out.println(dto.toString());
		if (dao.createReply(dto)) {
			model.addAttribute("col", col);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("word", word);
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/bbs/reply", method = RequestMethod.GET)
	public String reply(int bbsno, Model model) {
		model.addAttribute("dto", dao.readReply(bbsno));
		return "/bbs/replyForm";
	}

	@RequestMapping(value = "/bbs/update", method = RequestMethod.POST)
	public String update(BbsDTO dto, Model model, String oldfile, String nowPage, String word, String col,
			HttpServletRequest request) {
		String basePath = request.getRealPath("/bbs/storage");
		int filesize = (int) dto.getFileMF().getSize();
		String filename = "";
		if (filesize > 0) {
			// Utility.deleteFile(basePath, oldfile);
			filename = Utility.saveFile(dto.getFileMF(), basePath);
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);

		Map map = new HashMap();
		map.put("bbsno", dto.getBbsno());
		map.put("passwd", dto.getPasswd());
		System.out.println(dto.getPasswd());
		boolean pflag = dao.passCheck(map);
		if (pflag) {
			if (dao.update(dto)) {
				Utility.deleteFile(basePath, oldfile);
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				model.addAttribute("nowPage", nowPage);
				return "redirect:./list";
			} else {
				return "error";
			}
		} else {
			if (filesize > 0)
				Utility.deleteFile(basePath, filename);
			return "passwdError";
		}
	}

	@RequestMapping(value = "/bbs/update", method = RequestMethod.GET)
	public String update(int bbsno, Model model) {
		model.addAttribute("dto", dao.read(bbsno));
		return "/bbs/update";
	}

	@RequestMapping("/bbs/read")
	public String read(int bbsno, Model model) {
		dao.upViewcnt(bbsno);
		BbsDTO dto = dao.read(bbsno);
		String content = "";
		content = dto.getContent().replaceAll("\r\n", "<br>");
		dto.setContent(content);
		model.addAttribute("dto", dto);
		return "/bbs/read";
	}

	@RequestMapping(value = "/bbs/create", method = RequestMethod.POST)
	public String create(BbsDTO dto, HttpServletRequest request) {
		String basePath = request.getRealPath("/bbs/storage");
		int filesize = (int) dto.getFileMF().getSize();
		String filename = "member.jpg";
		if (filesize > 0) {
			filename = Utility.saveFile(dto.getFileMF(), basePath);
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);

		if (dao.create(dto)) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/bbs/create", method = RequestMethod.GET)
	public String create() {
		return "/bbs/create";
	}

	@RequestMapping("bbs/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}
		// 검색end
		// 페이징 관련------------------------------------------------
		int nowPage = 1; // 현재 보고 있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5; // 한 페이지당 보여줄 레코드 갯수 나중에는 Constant 같은 클래스를 만들어서
								// 상수를 한번에 관리 하도록 하자.

		// DB에서 가져올 순번------------------------------------------
		int sno = (nowPage - 1) * recordPerPage + 1;
		int eno = nowPage * recordPerPage;

		// 검색에 대한 데이터를 리스트에가서 뽑아와야함.
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		List<BbsDTO> list = dao.list(map);
		int total = dao.total(col, word);
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);

		return "/bbs/list";
	}
}
