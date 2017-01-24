package spring.sts.blog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.imgbbs.ImgbbsDAO;
import spring.model.imgbbs.ImgbbsDTO;
import spring.utility.blog.Utility;

@Controller
public class ImgBbsController {

	@Autowired
	private ImgbbsDAO dao;

	@RequestMapping(value = "/imgbbs/reply", method = RequestMethod.POST)
	public String reply(ImgbbsDTO dto, HttpServletRequest request, Model model, String nowPage, String word,
			String col) {
		String basePath = request.getRealPath("/imgbbs/storage");
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
		System.out.println(filesize);
		dao.addAnsnum(map);
		System.out.println("imgcontroller:" + dto.toString());
		if (dao.createreply(dto)) {
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("word", word);
			model.addAttribute("col", col);
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/imgbbs/reply", method = RequestMethod.GET)
	public String reply(Model model, int no) {
		model.addAttribute("dto", dao.readReply(no));
		return "/imgbbs/reply";
	}

	@RequestMapping(value = "/imgbbs/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, int no, String passwd, String oldfile, String word, String col,
			String nowPage, Model model) {
		String basePath = request.getRealPath("/imgbbs/storage");
		Map map = new HashMap();
		map.put("no", no);
		map.put("passwd", passwd);
		boolean pflag = dao.passCheck(map);
		if (pflag) {
			if (dao.delete(no)) {
				if (oldfile != null && !oldfile.equals("member.jpg"))
					Utility.deleteFile(basePath, oldfile);
			} else {
				return "error";
			}
			model.addAttribute("word", word);
			model.addAttribute("col", col);
			model.addAttribute("nowPage", nowPage);
			return "redirect:./list";
		} else {
			return "passwdError";
		}
	}

	@RequestMapping(value = "/imgbbs/delete", method = RequestMethod.GET)
	public String delete(int no, Model model) {
		model.addAttribute("flag", dao.chechRefno(no));
		return "/imgbbs/delete";
	}

	@RequestMapping(value = "/imgbbs/update", method = RequestMethod.POST)
	public String update(ImgbbsDTO dto, HttpServletRequest request, String oldfile) {
		String basePath = request.getRealPath("/imgbbs/storage");
		int filesize = (int) dto.getFileMF().getSize();
		String filename = "member.jpg";
		if (filesize > 0) {
			filename = Utility.saveFile(dto.getFileMF(), basePath);
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);

		Map map = new HashMap();
		map.put("no", dto.getNo());
		map.put("passwd", dto.getPasswd());
		boolean pflag = dao.passCheck(map);
		if (pflag) {
			if (dao.update(dto)) {
				if (oldfile != null && !oldfile.equals("member.jpg")) {
					Utility.deleteFile(basePath, oldfile);
				}
				return "redirect:./list";
			} else {
				return "error";
			}
		} else {
			return "passwdError";
		}
	}

	@RequestMapping(value = "/imgbbs/update", method = RequestMethod.GET)
	public String update(int no, Model model) {
		ImgbbsDTO dto = dao.read(no);
		model.addAttribute("dto", dto);
		return "/imgbbs/update";
	}

	@RequestMapping(value = "/imgbbs/create", method = RequestMethod.POST)
	public String create(ImgbbsDTO dto, HttpServletRequest request) {
		String basePath = request.getRealPath("/imgbbs/storage");
		int filesize = (int) dto.getFileMF().getSize();
		String filename = "member.jpg";
		if (filesize > 0) {
			filename = Utility.saveFile(dto.getFileMF(), basePath);
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		System.out.println(filesize);

		if (dao.create(dto)) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/imgbbs/create", method = RequestMethod.GET)
	public String create() {
		return "/imgbbs/create";
	}

	@RequestMapping("/imgbbs/read")
	public String read(int no, Model model, HttpServletRequest request) {
		dao.upViewcnt(no);
		ImgbbsDTO dto = dao.read(no);
		String content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");
		List list = dao.imgRead(no);
		String[] files = (String[]) list.get(0);
		int[] noArr = (int[]) list.get(1);

		model.addAttribute("noArr", noArr);
		model.addAttribute("files", files);
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		model.addAttribute("no", no);
		model.addAttribute("dto", dto);
		return "/imgbbs/read";
	}

	@RequestMapping("/imgbbs/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if (col.equals("total")) {
			word = "";
		}
		// 페이징관련
		int nowPage = 1;
		int recordPerPage = 5;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		ImgbbsDAO dao = new ImgbbsDAO();
		List<ImgbbsDTO> list = dao.list(map);
		int total = dao.total(col, word);

		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		return "/imgbbs/list";
	}
}
