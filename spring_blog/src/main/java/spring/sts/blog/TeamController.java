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

import spring.model.team.TeamDAO;
import spring.model.team.TeamDTO;
import spring.utility.blog.Utility;

@Controller
public class TeamController {
	@Autowired
	private TeamDAO dao;

	@RequestMapping("/team/delete")
	public String delete(int teamno, String oldfile, HttpServletRequest request, String word, String col,
			String nowPage, Model model) {
		String basePath = request.getRealPath("/team/storage");
		boolean flag = dao.delete(teamno);
		if (flag) {
			if (oldfile != null && !oldfile.equals("member.jpg"))
				Utility.deleteFile(basePath, oldfile);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/team/update", method = RequestMethod.POST)
	public String update(TeamDTO dto, String oldfile, HttpServletRequest request, String word, String col,
			String nowPage, Model model) {
		String basePath = request.getRealPath("/team/storage");
		int filesize = (int) dto.getFileMF().getSize();
		String filename = "member.jpg";
		if (filesize > 0) {
			if (oldfile != null && !oldfile.equals("member.jpg"))
				;
			Utility.deleteFile(basePath, oldfile);
			filename = Utility.saveFile(dto.getFileMF(), basePath);
		}
		dto.setFilename(filename);
		boolean flag = dao.update(dto);
		if (flag) {
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/team/update", method = RequestMethod.GET)
	public String update(int teamno, Model model) {
		model.addAttribute("dto", dao.read(teamno));
		return "/team/update";
	}

	@RequestMapping("/team/read")
	public String read(int teamno, Model model) {
		model.addAttribute("dto", dao.read(teamno));
		return "/team/read";
	}

	@RequestMapping(value = "/team/create", method = RequestMethod.GET)
	public String create() {
		return "/team/create";
	}

	@RequestMapping(value = "/team/create", method = RequestMethod.POST)
	public String create(TeamDTO dto, HttpServletRequest request) {
		String basePath = request.getRealPath("/team/storage");
		int filesize = (int) dto.getFileMF().getSize();
		String filename = "";
		if (filesize > 0) {
			filename = Utility.saveFile(dto.getFileMF(), basePath);
		}
		dto.setFilename(filename);
		if (dao.create(dto)) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping("/team/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if (col.equals("total"))
			word = "";

		int nowPage = 1; // 현재페이지, 변경가능
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5; // 한 페이지당 보여줄 레코드 갯수

		// DB 가져올 순번.
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = dao.total(col, word);
		List<TeamDTO> list = dao.list(map);
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);

		return "/team/list";
	}
}
