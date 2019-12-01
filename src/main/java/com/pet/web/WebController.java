package com.pet.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pet.model.BasketDTO;
import com.pet.model.BoardDTO;
import com.pet.model.CommantDTO;
import com.pet.model.PetDAO;
import com.pet.model.PlaceDTO;
import com.pet.model.ProductDTO;
import com.pet.model.SangdamDTO;
import com.pet.model.UpDTO;
import com.pet.model.ZzimDTO;
import com.pet.model.memberDTO;

@Controller
public class WebController {
	@Autowired
	private PetDAO dao;
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "gallerypage.do")
	public String gallerypage(Model model) {
		List<BoardDTO> list = this.dao.dog_Best();
		List<BoardDTO> list2 = this.dao.cat_Best();
		List<BoardDTO> list3 = this.dao.free_Best();
		model.addAttribute("Best", list);
		model.addAttribute("Best2", list2);
		model.addAttribute("Best3", list3);
		return "gallerypage";
	}

	@RequestMapping(value = "/parceloutpage.do")
	public String parceloutpage(Model model) {
		int page = 1;
		int maxView = 10;
		int block = 3;
		int allPage = 0;
		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;
		List<BoardDTO> list = dao.getParList();
		allPage = (int) Math.ceil((list.size()) / (double) maxView);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		List<BoardDTO> list2 = new ArrayList<BoardDTO>();
		for (int i = 0; i < (list.size() > 10 ? 10 : list.size()); i++) {
			list2.add(list.get(i));
		}
		model.addAttribute("list", list2);
		model.addAttribute("cate", 99);
		model.addAttribute("maincate", 1);
		model.addAttribute("page", page);
		model.addAttribute("start", startBlock);
		model.addAttribute("end", endBlock);
		model.addAttribute("all", allPage);

		return "parceloutpage";
	}

	@RequestMapping(value = "servicecenterpage.do")
	public String servicecenterpage(Model model) {
		return "servicecenterpage";
	}

	@RequestMapping(value = "/login.do")
	public String loginpage(Model model) {
		return "loginpage";
	}

	@RequestMapping(value = "/terms.do")
	public String terms(Model model) {
		return "termsofuse";
	}

	@RequestMapping(value = "/registerterms.do")
	public String registerterms(Model model) {
		return "registerterms";
	}

	@RequestMapping(value = "/registeruser.do", method = RequestMethod.POST)
	public void registeruser(Model model, @RequestParam("terms") String terms, @RequestParam("info") String info,
			HttpServletResponse response) throws IOException {

	}

	@RequestMapping(value = "/userregister.do")
	public String userregister(Model model) {
		return "userregister";
	}

	@RequestMapping(value = "/doginfo.do")
	public String doginfo(Model model) {

		
		List<BoardDTO> list = this.dao.dogInfo_getList();
	
		model.addAttribute("List", list);

		return "doginfo";
	}
	@RequestMapping(value = "/catinfo.do")
	public String catinfo(Model model) {

		
		List<BoardDTO> list = this.dao.catInfo_getList();
	
		model.addAttribute("List", list);

		return "catinfo";
	}
	@RequestMapping(value="/info.do")
	public String info(Model model) {
		List<BoardDTO> list = this.dao.dogInfo_getList();
		List<BoardDTO> list2 = this.dao.catInfo_getList();
		model.addAttribute("List", list);
		model.addAttribute("List2",list2);
		return "info";
	}
	@RequestMapping(value="/info_insert.do")
	public String info_insert(Model model) {
		return "info_insert";
	}
	@RequestMapping(value="/info_insert_ok.do")
	public String info_insert_ok(MultipartHttpServletRequest mtfRequest,BoardDTO dto) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String safeFile = "";
		String koko = "";

		String path = "C:\\workspace(spring)\\PetWebProject\\src\\main\\webapp\\resources\\upload\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
			if (fileSize > 0) {
				safeFile += System.currentTimeMillis() + originFileName + "/";
				koko = path + System.currentTimeMillis() + originFileName + "/";
				try {
					mf.transferTo(new File(koko));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

		}
		dto.setUpload(safeFile);
		System.out.println(safeFile);
		this.dao.info_insertBoard(dto);
		return "redirect:info.do";
	}

	@RequestMapping(value = "/idchk.do")
	public String idchk(Model model, @RequestParam("id") String id) {
		model.addAttribute("chk", dao.idchk(id));
		model.addAttribute("id", id);
		return "idchk";
	}

	@RequestMapping(value = "/nickchk.do")
	public String inickchk(Model model, @RequestParam("nick") String nick) {
		model.addAttribute("chk", dao.nickchk(nick));
		model.addAttribute("nick", nick);
		return "nickchk";
	}

	@RequestMapping(value = "/adduser.do", method = RequestMethod.POST)
	public String userregister(Model model, memberDTO dto) {
		dao.adduser(dto);
		model.addAttribute("id", dto.getId());
		return "redirect:chkuserinfo.do";
	}

	@RequestMapping("/chkuserinfo.do")
	public String chkuserinfo(Model model, @RequestParam("id") String id) {
		memberDTO dto = dao.getUserInfo(id);
		model.addAttribute("dto", dto);
		return "chkuserinfo";
	}

	@RequestMapping(value = "/logintry.do", method = RequestMethod.POST)
	public void logintry(Model model, memberDTO dto, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int a = dao.login(dto);
		if (a == 1) {
			session.setAttribute("userid", dto.getId());
			memberDTO dto2 = dao.getUserInfo(dto.getId());
			session.setAttribute("nickname", dto2.getNickname());
			out.println("<script>");
			out.println("location.href='main.do'");
			out.println("</script>");
		} else {

			out.println("<script>");
			out.println("alert('아이디또는 비밀번호가 틀렸습니다.')");
			out.println("location.href='login.do'");
			out.println("</script>");

		}
	}

	@RequestMapping(value = "/mypage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String mypage(Model model, @RequestParam("id") String id) {
		memberDTO userinfo = dao.getUserInfo(id);
		model.addAttribute("dto", userinfo);
		return "mypage";
	}

	@RequestMapping(value = "logout.do")
	public String logout() {
		return "logout";
	}

	@RequestMapping(value = "/search.do")
	public String search(Model model, @RequestParam("find_field") String find_field,
			@RequestParam("find_name") String find_name) {
		List<BoardDTO> list = this.dao.search(find_field, find_name);
		model.addAttribute("search", list);
		return "searchpage";
	}

	

	@RequestMapping(value = "/memberupdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String changeUserInfo(Model model, @RequestParam("id") String id) {// id값을 받아온다.
		memberDTO dto = dao.getUserInfo(id);
		model.addAttribute("dto", dto);
		return "updatemember";
	}

	@RequestMapping(value = "/ok_memberupdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public void editOk(memberDTO dto, @RequestParam("pwd") String pwd, @RequestParam("pwdchk") String pwdchk,
			HttpServletResponse response, HttpServletRequest request, @RequestParam("backnickname") String backnickname)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("backnickname" + backnickname);

		PrintWriter out = response.getWriter();
		if (pwd.equals(pwdchk)) {
			this.dao.boardWriterUpdate(backnickname, dto.getNickname());
			this.dao.commantWriterUpdate(backnickname, dto.getNickname());
			dao.updateUser(dto);
			memberDTO dto2 = dao.getUserInfo(dto.getId());
			HttpSession session = request.getSession();
			session.setAttribute("nickname", dto2.getNickname());
			out.println("<script>");
			out.println("alert('회원정보 변경 완료.')");
			out.println("location.href='mypage.do?id=" + dto.getId() + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.')");
			out.println("location.href='memberupdate.do?id=" + dto.getId() + "'");
			out.println("</script>");
		}

	}

	@RequestMapping("/memberout.do")
	public void out(Model model, @RequestParam("id") String id, HttpServletResponse response,
			HttpServletRequest request) // id값을 받아온다.
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.invalidate();
		dao.deleteUser(id);
		out.println("<script>");
		out.println("alert('탈퇴가 완료 되었습니다.')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	}

	@RequestMapping("/csssd.do") // 이건 눈아퍼요
	public String csssd(Model model) {
		return "csss";
	}

	@RequestMapping("/oneorone.do") // 1대1문의 페이지
	public String oneorone(Model model) {
		return "oneorone";
	}

	@RequestMapping("/sangdam.do") // 문의내용 작성
	public String sangdam(Model model) {
		return "sangdam";
	}

	@RequestMapping("/yackon.do") // 약관
	public String yackon(Model model) {
		return "yackon";
	}

	@RequestMapping("/sangdam_post.do") // 문의내용
	public String sangdampost(Model model, SangdamDTO dto) {
		dao.sandamg(dto);
		return "post_ok";
	}

	@RequestMapping("/dog_board.do")
	public String dog_board(Model model, @RequestParam("page") int dpage) {
		int rowsize = 15; // 한페이지당 보여질 게시물 수
		int block = 3; // 아래에 보여질 페이지 페이지 최대 수 - 예)[1][2][3] / [4][5][6]
		int totalRecord = 0; // DB 상의 레코드 전체 수(게시글의 수)
		int allPage = 0; // 전체 페이지 수
		int page = 0;
		if (dpage != 0) {
			page = dpage;

		} else {
			// 처음으로 리스트 페이지에 들어온 경우
			page = 1;

		}
		int startNo = (page * rowsize) - (rowsize - 1);
		// 해당 페이지에서의 끝번호
		int endNo = (page * rowsize);

		// 해당 페이지의 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		// 해당 페이지의 끝 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		totalRecord = this.dao.dog_Count();
		allPage = (int) Math.ceil((double) totalRecord / rowsize);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		List<BoardDTO> list = this.dao.dog_getList(page, rowsize);
		model.addAttribute("page", page);
		model.addAttribute("rowsize", rowsize);
		model.addAttribute("block", block);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("allPage", allPage);
		model.addAttribute("startNo", startNo);
		model.addAttribute("endNo", endNo);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("List", list);

		/*
		 * List<BoardDTO> list=this.dao.dog_getList(); model.addAttribute("List", list);
		 */
		return "dog_board";
	}

	@RequestMapping("/cat_board.do")
	public String cat_board(Model model, @RequestParam("page") int dpage) {
		int rowsize = 15; // 한페이지당 보여질 게시물 수

		int block = 3; // 아래에 보여질 페이지 페이지 최대 수 - 예)[1][2][3] / [4][5][6]
		int totalRecord = 0; // DB 상의 레코드 전체 수(게시글의 수)
		int allPage = 0; // 전체 페이지 수
		int page = 0;
		if (dpage != 0) {
			page = dpage;

		} else {
			// 처음으로 리스트 페이지에 들어온 경우
			page = 1;

		}
		int startNo = (page * rowsize) - (rowsize - 1);
		// 해당 페이지에서의 끝번호
		int endNo = (page * rowsize);

		// 해당 페이지의 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		// 해당 페이지의 끝 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		totalRecord = this.dao.dog_Count();
		allPage = (int) Math.ceil((double) totalRecord / rowsize);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		List<BoardDTO> list = this.dao.cat_getList(page, rowsize);
		model.addAttribute("page", page);
		model.addAttribute("rowsize", rowsize);
		model.addAttribute("block", block);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("allPage", allPage);
		model.addAttribute("startNo", startNo);
		model.addAttribute("endNo", endNo);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("List", list);

		/*
		 * List<BoardDTO> list=this.dao.dog_getList(); model.addAttribute("List", list);
		 */
		return "cat_board";
	}

	@RequestMapping("/free_board.do")
	public String free_board(Model model, @RequestParam("page") int dpage) {
		int rowsize = 15; // 한페이지당 보여질 게시물 수
		int block = 3; // 아래에 보여질 페이지 페이지 최대 수 - 예)[1][2][3] / [4][5][6]
		int totalRecord = 0; // DB 상의 레코드 전체 수(게시글의 수)
		int allPage = 0; // 전체 페이지 수
		int page = 0;
		if (dpage != 0) {
			page = dpage;

		} else {
			// 처음으로 리스트 페이지에 들어온 경우
			page = 1;

		}
		int startNo = (page * rowsize) - (rowsize - 1);
		// 해당 페이지에서의 끝번호
		int endNo = (page * rowsize);

		// 해당 페이지의 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		// 해당 페이지의 끝 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		totalRecord = this.dao.free_Count();
		allPage = (int) Math.ceil((double) totalRecord / rowsize);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		List<BoardDTO> list = this.dao.free_getList(page, rowsize);
		model.addAttribute("page", page);
		model.addAttribute("rowsize", rowsize);
		model.addAttribute("block", block);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("allPage", allPage);
		model.addAttribute("startNo", startNo);
		model.addAttribute("endNo", endNo);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("List", list);

		/*
		 * List<BoardDTO> list=this.dao.dog_getList(); model.addAttribute("List", list);
		 */
		return "free_board";
	}

	@RequestMapping("/main.do")
	public String main(Model model) {
		return "../../main";
	}

	@RequestMapping("/dog_insert.do")
	public String d_insert(Model model) {
		return "dog_insert";
	}

	@RequestMapping("/dog_insert_ok.do")
	public String requestupload2(MultipartHttpServletRequest mtfRequest, BoardDTO dto)
			throws UnsupportedEncodingException {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String safeFile = "";
		String koko = "";

		String path = "C:\\workspace(spring)\\PetWebProject\\src\\main\\webapp\\resources\\upload\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
			if (fileSize > 0) {
				safeFile += System.currentTimeMillis() + originFileName + "/";
				koko = path + System.currentTimeMillis() + originFileName + "/";
				try {
					mf.transferTo(new File(koko));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

		}
		dto.setUpload(safeFile);
		System.out.println(safeFile);
		this.dao.dog_insertBoard(dto);

		return "redirect:dog_board.do?page=1";
	}

	@RequestMapping("/cat_insert.do")
	public String c_insert(Model model) {
		return "cat_insert";
	}

	@RequestMapping("/cat_insert_ok.do")
	public String requestupload3(MultipartHttpServletRequest mtfRequest, BoardDTO dto)
			throws UnsupportedEncodingException {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String safeFile = "";
		String koko = "";

		String path = "C:\\workspace(spring)\\PetWebProject\\src\\main\\webapp\\resources\\upload\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
			if (fileSize > 0) {
				safeFile += System.currentTimeMillis() + originFileName + "/";
				koko = path + System.currentTimeMillis() + originFileName + "/";
				try {
					mf.transferTo(new File(koko));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

		}
		dto.setUpload(safeFile);
		System.out.println(safeFile);
		this.dao.cat_insertBoard(dto);

		return "redirect:cat_board.do?page=1";
	}

	@RequestMapping("/free_insert.do")
	public String f_insert(Model model) {
		return "free_insert";
	}

	@RequestMapping("/free_insert_ok.do")
	public String requestupload4(MultipartHttpServletRequest mtfRequest, BoardDTO dto)
			throws UnsupportedEncodingException {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String safeFile = "";
		String koko = "";

		String path = "C:\\workspace(spring)\\PetWebProject\\src\\main\\webapp\\resources\\upload\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
			if (fileSize > 0) {
				safeFile += System.currentTimeMillis() + originFileName + "/";
				koko = path + System.currentTimeMillis() + originFileName + "/";
				try {
					mf.transferTo(new File(koko));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

		}
		dto.setUpload(safeFile);
		System.out.println(safeFile);
		this.dao.free_insertBoard(dto);

		return "redirect:free_board.do?page=1";
	}

	@RequestMapping(value = "/readcount.do", method = RequestMethod.GET)
	public String fuckyou(@RequestParam("no") int no, Model model, HttpServletRequest request) {
		this.dao.readCount(no); // 조회수 증가
		return "redirect:cont.do?no=" + no + "&cpage=1";
	}

	@RequestMapping(value = "/cont.do", method = RequestMethod.GET)
	public String cont(@RequestParam("no") int no, Model model, HttpServletRequest request,
			@RequestParam("cpage") int cpage) {
		int rowsize = 5; // 한페이지당 보여질 게시물 수
		int block = 10; // 아래에 보여질 페이지 페이지 최대 수 - 예)[1][2][3] / [4][5][6]
		int totalRecord = 0; // DB 상의 레코드 전체 수(게시글의 수)
		int allPage = 0; // 전체 페이지 수
		int commant_page = 0;
		if (cpage != 0) {
			commant_page = cpage;

		} else {
			// 처음으로 리스트 페이지에 들어온 경우
			commant_page = 1;

		}
		int startNo = (commant_page * rowsize) - (rowsize - 1);
		// 해당 페이지에서의 끝번호
		int endNo = (commant_page * rowsize);
		// 해당 페이지의 시작 블럭
		int startBlock = (((commant_page - 1) / block) * block) + 1;
		// 해당 페이지의 끝 블럭
		int endBlock = (((commant_page - 1) / block) * block) + block;
		totalRecord = this.dao.commant_count(no);
		allPage = (int) Math.ceil((double) totalRecord / rowsize);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		UpDTO dto3 = new UpDTO();
		List<CommantDTO> list = this.dao.Commant_getList(commant_page, rowsize, no);
		if (list.size() != 0) {
			list = this.dao.Commant_getList123(list.get(0).getNo(), list.get(list.size() - 1).getNo(), no);
		}
		HttpSession session = request.getSession();
		dto3.setCate(1);
		dto3.setId("");
		try {
			if (!(session.getAttribute("userid").equals(null) || session.getAttribute("userid").equals("")))
				dto3.setId((String) session.getAttribute("userid"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		dto3.setNo(no);// 보드넘버를 up넘버로
		int qwe = this.dao.chk(dto3);

		List<Integer> asd = new ArrayList<Integer>();
		List<Integer> grpCnt = new ArrayList<Integer>();
		dto3.setCate(2);

		int i = 0;
		for (CommantDTO go : list) {// 각댓글 조회
			dto3.setNo(go.getNo());// 객댓글 updto에 설정
			asd.add(this.dao.chk(dto3));// 객댓글 up조회,asd에
			grpCnt.add(this.dao.watchOn(go.getGrp()));

		}

		BoardDTO dto = this.dao.content(no); // 상세내역 조회
		model.addAttribute("cont", dto);
		model.addAttribute("commant", list);
		model.addAttribute("grpCnt", grpCnt);
		model.addAttribute("qwe", qwe);
		model.addAttribute("asd", asd);
		model.addAttribute("cpage", commant_page);
		model.addAttribute("rowsize", rowsize);
		model.addAttribute("block", block);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("allPage", allPage);
		model.addAttribute("startNo", startNo);
		model.addAttribute("endNo", endNo);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		return "cont";
	}

	@RequestMapping("/like.do")
	public void like(Model model, @RequestParam("bno") int bno, HttpServletResponse response,
			@RequestParam("id") String id, @RequestParam("cpage") int cpage) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		UpDTO dto = new UpDTO();
		dto.setCate(1);
		dto.setId(id);
		dto.setNo(bno);
		this.dao.upchk(dto);
		this.dao.like(bno);
		model.addAttribute("upchk", dto);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		// out.println("alert('추천되었습니다.')");
		out.println("location.href='cont.do?no=" + bno + "&userid=" + id + "&cpage=" + cpage + "'");
		out.println("</script>");

	}

	@RequestMapping("/unlike.do")
	public void unlike(Model model, @RequestParam("bno") int bno, HttpServletResponse response,
			@RequestParam("id") String id, @RequestParam("cpage") int cpage) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		UpDTO dto = new UpDTO();
		dto.setCate(1);
		dto.setId(id);
		dto.setNo(bno);
		this.dao.downchk(dto);
		this.dao.unlike(bno);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		// out.println("alert('추천이 취소되었습니다..')");
		out.println("location.href='cont.do?no=" + bno + "&userid=" + id + "&cpage=" + cpage + "'");
		out.println("</script>");

	}

	@RequestMapping("/commant_like.do")
	public void commant_like(Model model, @RequestParam("bno") int bno, @RequestParam("no") int no,
			HttpServletResponse response, @RequestParam("id") String id, @RequestParam("cpage") int cpage)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		int asd = 0;
		UpDTO dto = new UpDTO();
		dto.setCate(2);
		dto.setId(id);
		dto.setNo(bno);
		this.dao.upchk(dto);
		asd = this.dao.chk(dto);
		this.dao.commant_like(bno);
		model.addAttribute("upchk", dto);
		model.addAttribute("asd", asd);
		System.out.println(asd);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		// out.println("alert('추천되었습니다.')");
		out.println("location.href='cont.do?no=" + no + "&userid=" + id + "&asd=" + asd + "&cpage=" + cpage + "'");
		out.println("</script>");

	}

	@RequestMapping("/commant_unlike.do")
	public void commant_unlike(Model model, @RequestParam("bno") int bno, @RequestParam("no") int no,
			HttpServletResponse response, @RequestParam("id") String id, @RequestParam("cpage") int cpage)
			throws IOException {
		int asd = 1;
		response.setContentType("text/html; charset=UTF-8");
		UpDTO dto = new UpDTO();
		dto.setCate(2);
		dto.setId(id);
		dto.setNo(bno);

		this.dao.downchk(dto);
		asd = this.dao.chk(dto);
		this.dao.commant_unlike(bno);
		model.addAttribute("asd", asd);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		// out.println("alert('추천이 취소되었습니다..')");
		out.println("location.href='cont.do?no=" + no + "&userid=" + id + "&asd=" + asd + "&cpage=" + cpage + "'");
		out.println("</script>");

	}

	@RequestMapping(value = "/commant.do", method = RequestMethod.POST)
	public String commant(Model model, CommantDTO dto, @RequestParam("no") int no, @RequestParam("cpage") int cpage) {
		if (!(dto.getWriter().equals(""))) {
			/* int grpCnt = 1; */

			dto.setBno(no);
			this.dao.insertCommant(dto);

			/*
			 * BoardDTO contdto = this.dao.content(no); List<CommantDTO> list =
			 * this.dao.Commant_getList(no);
			 */
			/*
			 * model.addAttribute("contdto", contdto); model.addAttribute("list", list);
			 * grpCnt = this.dao.watchOn(dto); model.addAttribute("grpCnt", grpCnt);
			 */
			return "redirect:cont.do?no=" + no + "&cpage=" + cpage;
		} else {

			return "redirect:login.do";
		}

	}

	@RequestMapping(value = "/reply.do", method = RequestMethod.POST)
	public String reply(Model model, CommantDTO dto, @RequestParam("bno") int bno, @RequestParam("grp") int grp,
			@RequestParam("step") int step, @RequestParam("indent") int indent, @RequestParam("cpage") int cpage) {

		if (!(dto.getWriter().equals(""))) {
			/* int grpCnt = 1; */
			dto.setBno(bno);
			dto.setGrp(grp);
			dto.setStep(step);
			dto.setIndent(indent);
			List<CommantDTO> list = dao.test(dto);
			boolean inside = true;
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getIndent() <= dto.getIndent()) {
					dto.setStep(list.get(i).getStep());
					dao.replyUpdate(dto);
					inside = false;
					break;
				}
			}
			if (inside) {
				dto.setStep(dao.testMax(dto) + 1);
			}
			this.dao.replyAdd(dto);
			/*
			 * BoardDTO contdto = this.dao.content(bno); list =
			 * this.dao.Commant_getList(bno); grpCnt = this.dao.watchOn(dto);
			 * model.addAttribute("grpCnt", grpCnt); model.addAttribute("grpCnt", list);
			 * model.addAttribute("grpCnt", contdto);
			 */

			return "redirect:cont.do?no=" + bno + "&cpage=" + cpage;
		} else {

			return "redirect:login.do";
		}
	}

	@RequestMapping("/free_update.do")
	public String free_update(@RequestParam("bno") int bno, Model model) {
		model.addAttribute("bno", bno);
		BoardDTO dto = this.dao.content(bno);
		model.addAttribute("dto", dto);
		return "free_update";
	}

	@RequestMapping("/free_update_ok.do")
	public void free_update_ok(@RequestParam("bno") int bno, MultipartHttpServletRequest mtfRequest, BoardDTO dto,
			HttpServletResponse response, Model model, @RequestParam("put") List<String> put) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		dto.setUpload(dao.content(bno).getUpload());
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		int index = 0;
		String abc[] = new String[put.size()];
		String dupload = "";

		String safeFile = "";
		String koko = "";
		String path = "C:\\workspace(spring)\\PetWebProject\\src\\main\\webapp\\resources\\upload\\";
		long fileSize = 0;
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			if (fileSize > 0) {
				safeFile += System.currentTimeMillis() + originFileName + "/";
				koko = path + System.currentTimeMillis() + originFileName + "/";
				try {
					mf.transferTo(new File(koko));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			System.out.println("풋사이즈" + put.size());
			if (put.size() > 0) {
				for (int i = 0; i < put.size(); i++) {
					abc[i] = put.get(i);
					abc[i] = abc[i].replace("http://localhost:8686/web/resources/upload//",
							"C:\\workspace(spring)\\PetWebProject\\src\\main\\webapp\\resources\\upload\\");

					if (abc[i].length() > 0) {
						File file = new File(abc[i]);
						if (file.delete()) {
							System.out.println("응 삭제");
						} else {
							System.out.println("응 생존");
						}
						dupload = abc[i] + "/";
						dto.setUpload(dupload);
						this.dao.photoUpdate(dto);
						System.out.println("new : " + dupload);
						System.out.println("ㅋㅋㅋ");
						index = 1;
					}
				}
			}
			if (dao.content(bno).getUpload() == null) {
				dto.setUpload("");
				System.out.println("ㅋ");
			}

			dto.setNo(bno);
		}
		if (koko != "" && fileSize > 0) {

			dto.setUpload((dao.content(bno).getUpload() == null) ? safeFile : dao.content(bno).getUpload() + safeFile);
			System.out.println("ㅋㅋ");
		}
		if (index == 1) {
			dto.setUpload((dao.content(bno).getUpload() == null) ? safeFile : dao.content(bno).getUpload() + safeFile);
			index = 0;
		}

		this.dao.updateBoard(dto);
		out.println("<script>");
		out.println("alert('수정완료')");
		out.println("history.go(-3)");
		out.println("</script>");
	}

	@RequestMapping("/board_delete.do")
	public void board_delete(@RequestParam("bno") int bno, Model model, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		BoardDTO dto = this.dao.content(bno);
		int no = 0;
		List<CommantDTO> list = this.dao.Commant_getList(0, 0, bno);

		for (CommantDTO go : list) {
			no = go.getNo();
			this.dao.deleteBoardUp(no);
		}
		this.dao.deleteBoardUp(bno);
		this.dao.deleteCommantAll(dto);

		try {
			String[] files = dto.getUpload().split("/");
			for (String fi : files) {
				File file = new File(fi);
				file.delete();
			}
		} catch (Exception e) {
		}

		String cate = dto.getCate();
		this.dao.deleteBoard(dto);
		out.println("<script>");
		out.println("alert('삭제 완료')");
		if (cate.equals("dog") || cate.equals("cat") || cate.equals("free")) {
			out.println("location.href='gallerypage.do'");
		} else if(cate.equals("dogBy") || cate.equals("catBy")) {
			out.println("location.href='parceloutpage.do'");
		} else {
			out.println("location.href='info.do'");
		}
		out.println("</script>");

	}

	@RequestMapping(value = "/commant_delete.do")
	public String commant_delete(@RequestParam("bno") int bno, Model model, @RequestParam("no") int no,
			@RequestParam("a") String id, @RequestParam("d") int cpage) {
		System.out.println("bno는" + no);
		UpDTO dto = new UpDTO();

		dto.setId(id);
		dto.setNo(no);
		dto.setCate(2);

		this.dao.downchk(dto);
		this.dao.deleteCommantOne(no);
		System.out.println("커먼트딜리트에 왔다잇");
		return "redirect:cont.do?no=" + bno + "&userid=" + id + "&cpage=" + cpage;
	}

	@RequestMapping(value = "/commant_update.do", method = RequestMethod.POST)
	public String commant_update(@RequestParam("bno") int bno, Model model, @RequestParam("no") int no, CommantDTO dto,
			@RequestParam("userid") String id, @RequestParam("cpage") int cpage) {
		dto.setNo(no);
		System.out.println("커먼트업데이트에 왔다잇");
		this.dao.updateCommant(dto);
		return "redirect:cont.do?no=" + bno + "&userid=" + id + "&cpage=" + cpage;
	}

	@RequestMapping(value = "/dog_search.do", method = RequestMethod.GET)
	public String dog_search(Model model, @RequestParam("find_field") String find_field,
			@RequestParam("find_name") String find_name, @RequestParam("page") int page) {
		int rowsize = 3;
		int block = 3;
		int totalRecord = 0;
		int allPage = 0;
		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);
		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;
		totalRecord = this.dao.dogSearchCount(find_field, find_name);
		allPage = (int) Math.ceil((double) totalRecord / rowsize);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		List<BoardDTO> list = this.dao.dogSearchList(page, rowsize, find_name, find_field);
		model.addAttribute("List", list);
		model.addAttribute("page", page);
		model.addAttribute("rowsize", rowsize);
		model.addAttribute("block", block);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("allPage", allPage);
		model.addAttribute("startNo", startNo);
		model.addAttribute("endNo", endNo);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("find_name", find_name);
		model.addAttribute("find_field", find_field);

		return "dog_search";
	}

	@RequestMapping(value = "/cat_search.do", method = RequestMethod.GET)
	public String cat_search(Model model, @RequestParam("find_field") String find_field,
			@RequestParam("find_name") String find_name, @RequestParam("page") int page) {
		int rowsize = 3;
		int block = 3;
		int totalRecord = 0;
		int allPage = 0;
		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);
		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;
		totalRecord = this.dao.catSearchCount(find_field, find_name);
		allPage = (int) Math.ceil((double) totalRecord / rowsize);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		List<BoardDTO> list = this.dao.catSearchList(page, rowsize, find_name, find_field);
		model.addAttribute("List", list);
		model.addAttribute("page", page);
		model.addAttribute("rowsize", rowsize);
		model.addAttribute("block", block);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("allPage", allPage);
		model.addAttribute("startNo", startNo);
		model.addAttribute("endNo", endNo);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("find_name", find_name);
		model.addAttribute("find_field", find_field);

		return "cat_search";
	}

	@RequestMapping(value = "/free_search.do", method = RequestMethod.GET)
	public String free_search(Model model, @RequestParam("find_field") String find_field,
			@RequestParam("find_name") String find_name, @RequestParam("page") int page) {
		int rowsize = 3;
		int block = 3;
		int totalRecord = 0;
		int allPage = 0;
		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);
		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;
		totalRecord = this.dao.freeSearchCount(find_field, find_name);
		allPage = (int) Math.ceil((double) totalRecord / rowsize);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		List<BoardDTO> list = this.dao.freeSearchList(page, rowsize, find_name, find_field);
		model.addAttribute("List", list);
		model.addAttribute("page", page);
		model.addAttribute("rowsize", rowsize);
		model.addAttribute("block", block);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("allPage", allPage);
		model.addAttribute("startNo", startNo);
		model.addAttribute("endNo", endNo);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("find_name", find_name);
		model.addAttribute("find_field", find_field);

		return "free_search";
	}

	@RequestMapping(value = "/placepage.do")
	public String placepage(Model model) {
		return "placepage";
	}

	@RequestMapping(value = "/place.do")
	public String searchPlacePage(Model model, @RequestParam("place") int no, @RequestParam("page") int page) {
		int maxView = 6;
		int block = 3;
		int allPage = 0;
		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;
		if (no == 1) {
			List<PlaceDTO> dtoc = dao.getPlaceList("동물병원");
			allPage = (int) Math.ceil((dtoc.size()) / (double) maxView);
			if (endBlock > allPage) {
				endBlock = allPage;
			}
			List<PlaceDTO> dto = new ArrayList<PlaceDTO>();
			for (int i = (page - 1) * maxView; i < (page * maxView > dtoc.size() ? dtoc.size() : page * maxView); i++) {
				dto.add(dtoc.get(i));
			}
			model.addAttribute("place", "동물병원");
			model.addAttribute("list", dto);
		} else if (no == 2) {
			List<PlaceDTO> dtoc = dao.getPlaceList("애견카페");
			allPage = (int) Math.ceil((dtoc.size()) / (double) maxView);
			if (endBlock > allPage) {
				endBlock = allPage;
			}
			List<PlaceDTO> dto = new ArrayList<PlaceDTO>();
			for (int i = (page - 1) * maxView; i < (page * maxView > dtoc.size() ? dtoc.size() : page * maxView); i++) {
				dto.add(dtoc.get(i));
			}
			model.addAttribute("place", "애견카페");
			model.addAttribute("list", dto);
		} else if (no == 3) {
			List<PlaceDTO> dtoc = dao.getPlaceList("애견동반식당");
			allPage = (int) Math.ceil((dtoc.size()) / (double) maxView);
			if (endBlock > allPage) {
				endBlock = allPage;
			}
			List<PlaceDTO> dto = new ArrayList<PlaceDTO>();
			for (int i = (page - 1) * maxView; i < (page * maxView > dtoc.size() ? dtoc.size() : page * maxView); i++) {
				dto.add(dtoc.get(i));
			}
			model.addAttribute("place", "애견동반식당");
			model.addAttribute("list", dto);
		} else if (no == 4) {
			List<PlaceDTO> dtoc = dao.getPlaceList("숙박업소");
			allPage = (int) Math.ceil((dtoc.size()) / (double) maxView);
			if (endBlock > allPage) {
				endBlock = allPage;
			}
			List<PlaceDTO> dto = new ArrayList<PlaceDTO>();
			for (int i = (page - 1) * maxView; i < (page * maxView > dtoc.size() ? dtoc.size() : page * maxView); i++) {
				dto.add(dtoc.get(i));
			}
			model.addAttribute("place", "숙박업소");
			model.addAttribute("list", dto);
		} else if (no == 5) {
			List<PlaceDTO> dtoc = dao.getPlaceList("애견펜션");
			allPage = (int) Math.ceil((dtoc.size()) / (double) maxView);
			if (endBlock > allPage) {
				endBlock = allPage;
			}
			List<PlaceDTO> dto = new ArrayList<PlaceDTO>();
			for (int i = (page - 1) * maxView; i < (page * maxView > dtoc.size() ? dtoc.size() : page * maxView); i++) {
				dto.add(dtoc.get(i));
			}
			model.addAttribute("place", "애견펜션");
			model.addAttribute("list", dto);
		} else if (no == 6) {
			List<PlaceDTO> dtoc = dao.getPlaceList("애견동반식당");
			allPage = (int) Math.ceil((dtoc.size()) / (double) maxView);
			if (endBlock > allPage) {
				endBlock = allPage;
			}
			List<PlaceDTO> dto = new ArrayList<PlaceDTO>();
			for (int i = (page - 1) * maxView; i < (page * maxView > dtoc.size() ? dtoc.size() : page * maxView); i++) {
				dto.add(dtoc.get(i));
			}
			model.addAttribute("place", "애견동반식당");
			model.addAttribute("list", dto);
		}
		model.addAttribute("page", page);
		model.addAttribute("start", startBlock);
		model.addAttribute("end", endBlock);
		model.addAttribute("all", allPage);
		model.addAttribute("no", no);
		return "joominplace";
	}

	@RequestMapping(value = "placeinsert.do")
	public String placeinertpage() {
		return "placeinsert";
	}

	@RequestMapping(value = "placeinsert_ok.do")
	public String placeinertokpage(Model model, PlaceDTO dto, MultipartHttpServletRequest mtfRequest) {

		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String safeFile = "";
		String koko = "";

		String path = "C:\\workspace(spring)\\PetWebProject\\src\\main\\webapp\\resources\\upload\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			safeFile += System.currentTimeMillis() + originFileName + "/";
			koko = path + System.currentTimeMillis() + originFileName + "/";
			if (fileSize > 0) {
				try {
					mf.transferTo(new File(koko));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		dto.setPhoto(safeFile);
		System.out.println(safeFile);
		dao.addPlace(dto);

		return "placepage";
	}

	@RequestMapping("placeinfo.do")
	public String placeinfo(Model model, @RequestParam("no") int no) {
		PlaceDTO dto = dao.getPlaceInfo(no);
		model.addAttribute("info", dto);

		return "placeinfo";
	}

	@RequestMapping("/sangdamIndex.do")
	public String sangdamIndex(Model model) {
		List<SangdamDTO> list = this.dao.sangdam();
		model.addAttribute("List", list);
		return "SangdamIndex";
	}

	@RequestMapping(value = "/anserMail.do")
	public String anserMail(HttpServletRequest request, Model model, @RequestParam("mail") String mail) {
		model.addAttribute("mail", mail);
		return "GoEmail";
	}

	// 메일 전송 처리
	@RequestMapping(value = "/goMail.do")
	public String mailSending(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		response.setContentType("text/html; , charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String setfrom = "sangjin0346@gmail.com";
		String tomail = request.getParameter("tomail"); // 받는 사람 이메일
		String title = request.getParameter("title"); // 제목
		String content = request.getParameter("content"); // 내용
		dao.deleteSangdam(tomail);

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			System.out.println(setfrom);
			System.out.println(tomail);
			System.out.println(title);
			System.out.println(content);

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "deleteSangdam";

	}

	@RequestMapping("/sangdamdeleteOk.do")
	public String sangdamdeleteOk(Model model) {

		return "redirect:sangdamIndex.do";
	}

	@RequestMapping("/konggee.do")
	public String konggee(Model model) {
		List<BoardDTO> list = this.dao.konggeelist();
		model.addAttribute("List", list);
		return "konggee";
	}

	@RequestMapping("/konggee_insert.do")
	public String k_insert(Model model) {
		return "konggee_insert";
	}

	@RequestMapping("/konggee_insert_ok.do")
	public void konggeeInsertOk(MultipartHttpServletRequest mtfRequest, BoardDTO dto, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String safeFile = "";
		String koko = "";

		String path = "C:\\workspace(spring)\\PetWebProject\\src\\main\\webapp\\resources\\upload\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			safeFile += path + System.currentTimeMillis() + originFileName + "/";
			koko = path + System.currentTimeMillis() + originFileName + "/";
			try {
				mf.transferTo(new File(koko));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		dto.setUpload(safeFile);
		System.out.println(safeFile);
		this.dao.insertKonggee(dto);

		out.println("<script>");
		out.println("location.href='konggee.do'");
		out.println("</script>");

	}

	@RequestMapping(value = "/marketpage.do")
	public String marketpage(Model model) {
		int page = 1;
		int maxView = 12;
		int block = 3;
		int allPage = 0;
		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;
		List<ProductDTO> list = dao.getItemList();
		allPage = (int) Math.ceil((list.size()) / (double) maxView);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		List<ProductDTO> list2 = new ArrayList<ProductDTO>();
		for (int i = 0; i < (list.size() > 12 ? 12 : list.size()); i++) {
			list2.add(list.get(i));
		}
		model.addAttribute("list", list2);
		model.addAttribute("cate", 99);
		model.addAttribute("maincate", 1);
		model.addAttribute("page", page);
		model.addAttribute("start", startBlock);
		model.addAttribute("end", endBlock);
		model.addAttribute("all", allPage);
		return "market";
	}

	@RequestMapping(value = "/iteminsert.do")
	public String iteminsertPage(Model model) {
		return "iteminsert";
	}

	@RequestMapping(value = "/additem.do")
	public String additem(Model model, ProductDTO dto, @RequestParam("cateplus") int bigCate,
			MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String safeFile = "";
		String koko = "";

		String path = "C:\\workspace(spring)\\PetWebProject\\src\\main\\webapp\\resources\\upload\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
			safeFile += System.currentTimeMillis() + originFileName + "/";
			koko = path + System.currentTimeMillis() + originFileName + "/";
			if (fileSize > 0) {
				try {
					mf.transferTo(new File(koko));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		dto.setImage(safeFile);
		dto.setCate(dto.getCate() + (bigCate * 10));
		dao.addItem(dto);
		return "redirect:marketpage.do";
	}

	@RequestMapping(value = "/selectitempage.do")
	public String selectmarketpage(Model model, @RequestParam("cate") int cate, @RequestParam("maincate") int maincate,
			@RequestParam("page") int page) {
		int maxView = 12;
		int block = 3;
		int allPage = 0;
		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;
		List<ProductDTO> list;
		List<ProductDTO> list2 = new ArrayList<ProductDTO>();
		if (cate == 99) {
			if (maincate == 1) {
				list = dao.getItemList();
			} else if (maincate == 0) {
				list = dao.getSelectItemRange(1);
			} else {
				list = dao.getSelectItemRange(maincate);
			}
		} else {
			if (maincate == 1) {
				list = dao.getPublicCateItem(cate);
			} else if (maincate == 2) {
				list = dao.getCateItem(cate + maincate * 10 - 10);
			} else {
				list = dao.getCateItem(cate + maincate * 10);
			}
		}
		allPage = (int) Math.ceil((list.size()) / (double) maxView);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		for (int i = (page - 1) * maxView; i < (page * maxView > list.size() ? list.size() : page * maxView); i++) {
			list2.add(list.get(i));
		}
		model.addAttribute("list", list2);
		model.addAttribute("cate", cate);
		model.addAttribute("maincate", maincate);
		model.addAttribute("page", page);
		model.addAttribute("start", startBlock);
		model.addAttribute("end", endBlock);
		model.addAttribute("all", allPage);
		return "market";
	}

	@RequestMapping(value = "itemCont.do")
	public String itemCont(Model model, @RequestParam("no") int no) {
		ProductDTO dto = dao.getItemcont(no);
		model.addAttribute("dto", dto);
		return "itemcont";
	}

	@RequestMapping(value = "addbasket.do")
	public void addBasket(Model model, BasketDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (dao.isBasket(dto) == 0) {
			dao.addBasket(dto);
		} else {
			dao.addUpdateBasket(dto);
		}
		out.println("<head>");
		out.println("<script src=\"https://code.jquery.com/jquery-3.4.1.js\"></script>");
		out.println("<script>");
		out.println("$(function(){");
		out.println("var result = confirm('장바구니에 물건이 추가되었습니다. 장바구니로 이동하시겠습니까?');");
		out.println("if(result){");
		out.println("var f = document.createElement(\"form\");");
		out.println("f.action = \"basket.do\";");
		out.println("f.method = \"post\";");
		out.println("$(document.body).append(f);");
		out.println("var input = document.createElement(\"input\")");
		out.println("input.setAttribute(\"name\", \"id\");");
		out.println("input.setAttribute(\"type\", \"hidden\");");
		out.println("input.setAttribute(\"value\", \"" + dto.getId() + "\");");
		out.println("f.appendChild(input);");
		out.println("f.submit();");
		out.println("}else{");
		out.println("location.href='itemCont.do?no=" + dto.getPno() + "';}");
		out.println("});");
		out.println("</script>");
		out.println("<title>장바구니목록 추가 완료</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("</body>");
	}

	@RequestMapping(value = "basket.do", method = RequestMethod.POST)
	public String movebasketpage(Model model, @RequestParam("id") String id) {
		List<BasketDTO> basket = dao.getMyBasket(id);
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		for (int i = 0; i < basket.size(); i++) {
			list.add(dao.getItemcont(basket.get(i).getPno()));
		}
		model.addAttribute("list", list);
		model.addAttribute("basket", basket);
		return "mybasketpage";
	}

	@RequestMapping(value = "addzzim.do")
	public void addZzim(Model model, ZzimDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (dao.isZzim(dto) == 0) {
			dao.addZzim(dto);
			System.out.println("추가완료");
		}
		out.println("<head>");
		out.println("<script src=\"https://code.jquery.com/jquery-3.4.1.js\"></script>");
		out.println("<script>");
		out.println("$(function(){");
		out.println("var result = confirm('찜목록에 물건이 추가되었습니다. 찜목록으로 이동하시겠습니까?');");
		out.println("if(result){");
		out.println("var f = document.createElement(\"form\");");
		out.println("f.action = \"zzimpage.do\";");
		out.println("f.method = \"post\";");
		out.println("$(document.body).append(f);");
		out.println("var input = document.createElement(\"input\")");
		out.println("input.setAttribute(\"name\", \"id\");");
		out.println("input.setAttribute(\"type\", \"hidden\");");
		out.println("input.setAttribute(\"value\", \"" + dto.getId() + "\");");
		out.println("f.appendChild(input);");
		out.println("f.submit();");
		out.println("}else{");
		out.println("location.href='itemCont.do?no=" + dto.getPno() + "';}");
		out.println("});");
		out.println("</script>");
		out.println("<title>찜목록 추가 완료   </title>");
		out.println("</head>");
		out.println("<body>");
		out.println("</body>");
	}

	@RequestMapping(value = "zzimpage.do", method = RequestMethod.POST)
	public String movezzimpage(Model model, @RequestParam("id") String id) {
		List<Integer> zzim = dao.getMyZzim(id);
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		for (int i = 0; i < zzim.size(); i++) {
			list.add(dao.getItemcont(zzim.get(i)));
		}
		model.addAttribute("list", list);
		return "myzzimpage";
	}

	@RequestMapping(value = "deletezzim.do")
	public void deletezzim(Model model, @RequestParam("id") String id, @RequestParam("no") int no,
			HttpServletResponse response) throws IOException {
		ZzimDTO dto = new ZzimDTO();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		dto.setId(id);
		dto.setPno(no);
		dao.deleteZzimItem(dto);
		out.println("<head>");
		out.println("<script src=\"https://code.jquery.com/jquery-3.4.1.js\"></script>");
		out.println("<script>");
		out.println("$(function(){");
		out.println("var result = confirm('찜목록에서 물건을 삭제했습니다. 찜목록으로 이동하시겠습니까? (취소 클릭시 마켓 페이지로 이동)');");
		out.println("if(result){");
		out.println("var f = document.createElement(\"form\");");
		out.println("f.action = \"zzimpage.do\";");
		out.println("f.method = \"post\";");
		out.println("$(document.body).append(f);");
		out.println("var input = document.createElement(\"input\")");
		out.println("input.setAttribute(\"name\", \"id\");");
		out.println("input.setAttribute(\"type\", \"hidden\");");
		out.println("input.setAttribute(\"value\", \"" + dto.getId() + "\");");
		out.println("f.appendChild(input);");
		out.println("f.submit();");
		out.println("}else{");
		out.println("location.href='marketpage.do';}");
		out.println("});");
		out.println("</script>");
		out.println("<title>찜목록 삭제 완료   </title>");
		out.println("</head>");
	}

	@RequestMapping(value = "basketdelete.do", method = RequestMethod.POST)
	public String basketdelete(Model model, @RequestParam("pno") int pno, @RequestParam("userid") String id) {
		BasketDTO dto = new BasketDTO();
		dto.setId(id);
		dto.setPno(pno);
		dao.deleteBasketItem(dto);
		List<BasketDTO> basket = dao.getMyBasket(id);
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		for (int i = 0; i < basket.size(); i++) {
			list.add(dao.getItemcont(basket.get(i).getPno()));
		}
		model.addAttribute("list", list);
		model.addAttribute("basket", basket);
		return "mybasketpage";
	}

	@RequestMapping(value = "basketdeletemulti.do", method = RequestMethod.POST)
	public String basketdeletemulti(Model model, @RequestParam("pno") int[] pno, @RequestParam("userid") String id) {
		BasketDTO dto = new BasketDTO();
		dto.setId(id);
		for (int i = 0; i < pno.length; i++) {
			dto.setPno(pno[i]);
			dao.deleteBasketItem(dto);
		}
		List<BasketDTO> basket = dao.getMyBasket(id);
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		for (int i = 0; i < basket.size(); i++) {
			list.add(dao.getItemcont(basket.get(i).getPno()));
		}
		model.addAttribute("list", list);
		model.addAttribute("basket", basket);
		return "mybasketpage";
	}

	@RequestMapping(value = "addorder.do", method = RequestMethod.POST)
	public String addorder(Model model, @RequestParam("pno") int pno, @RequestParam("userid") String id,
			@RequestParam("num") int num) {

		List<ProductDTO> orderlist = new ArrayList<ProductDTO>();
		orderlist.add(dao.getItemcont(pno));
		List<Integer> numList = new ArrayList<Integer>();
		numList.add(num);
		model.addAttribute("orderList", orderlist);
		model.addAttribute("numList", numList);
		model.addAttribute("addr", dao.getUserInfo(id).getAddr());
		return "orderpage";
	}

	@RequestMapping(value = "basketordermulti.do")
	public String addordermulti(Model model, @RequestParam("pno") int[] pno, @RequestParam("userid") String id,
			@RequestParam("num") int[] num) {

		List<ProductDTO> orderlist = new ArrayList<ProductDTO>();
		for (int i = 0; i < pno.length; i++) {
			orderlist.add(dao.getItemcont(pno[i]));
		}
		List<Integer> numList = new ArrayList<Integer>();
		for (int i = 0; i < num.length; i++) {
			numList.add(num[i]);
		}
		model.addAttribute("orderList", orderlist);
		model.addAttribute("numList", numList);
		model.addAttribute("addr", dao.getUserInfo(id).getAddr());
		return "orderpage";
	}

	@RequestMapping(value = "changeBasketNum.do", method = RequestMethod.POST)
	public String changeBasketNum(Model model, @RequestParam("pno") int pno, @RequestParam("userid") String id,
			@RequestParam("num") int num) {
		BasketDTO dto = new BasketDTO();
		dto.setId(id);
		dto.setPno(pno);
		dto.setNum(num);
		dao.changeBasketNum(dto);
		List<BasketDTO> basket = dao.getMyBasket(id);
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		for (int i = 0; i < basket.size(); i++) {
			list.add(dao.getItemcont(basket.get(i).getPno()));
		}
		model.addAttribute("list", list);
		model.addAttribute("basket", basket);
		return "mybasketpage";
	}

	@RequestMapping(value = "pwdck1.do", method = RequestMethod.POST)
	public String pwdCk1(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		model.addAttribute("id", id);
		model.addAttribute("pwd", pwd);

		return "pwdck1";

	}

	@RequestMapping(value = "pwdck2.do", method = RequestMethod.POST)
	public String pwdCk2(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		model.addAttribute("id", id);
		model.addAttribute("pwd", pwd);

		return "pwdck2";

	}

	@RequestMapping(value = "/selectparce.do")
	public String selectparce(Model model, @RequestParam("maincate") int maincate, @RequestParam("page") int page) {
		int maxView = 10;
		int block = 3;
		int allPage = 0;
		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;
		List<BoardDTO> list;
		List<BoardDTO> list2 = new ArrayList<BoardDTO>();
		if (maincate == 1) {
			list = dao.getParList();
		} else if (maincate == 0) {
			list = dao.getCatParList();
		} else {
			list = dao.getDogParList();
		}
		allPage = (int) Math.ceil((list.size()) / (double) maxView);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		for (int i = (page - 1) * maxView; i < (page * maxView > list.size() ? list.size() : page * maxView); i++) {
			list2.add(list.get(i));
		}
		model.addAttribute("list", list2);
		model.addAttribute("maincate", maincate);
		model.addAttribute("page", page);
		model.addAttribute("start", startBlock);
		model.addAttribute("end", endBlock);
		model.addAttribute("all", allPage);
		return "parceloutpage";
	}

	@RequestMapping(value = "parceloutwrite.do", method = RequestMethod.POST)
	public String parceloutwrite(Model model, @RequestParam("id") String userid) {
		model.addAttribute("id", userid);
		return "parceloutwrite";
	}

	@RequestMapping(value = "parceloutwriteok.do")
	public String parceloutwriteok(Model model, BoardDTO dto, MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String safeFile = "";
		String koko = "";

		String path = "C:\\workspace(spring)\\PetWebProject\\src\\main\\webapp\\resources\\upload\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
			if (fileSize > 0) {
				safeFile += System.currentTimeMillis() + originFileName + "/";
				koko = path + System.currentTimeMillis() + originFileName + "/";
				try {
					mf.transferTo(new File(koko));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

		}
		dto.setUpload(safeFile);
		System.out.println(safeFile);
		this.dao.parceloutwrite(dto);

		return "redirect:parceloutpage.do";
	}

	@RequestMapping(value = "by_update.do")
	public String by_update(@RequestParam("bno") int bno, Model model) {
		model.addAttribute("bno", bno);
		BoardDTO dto = this.dao.content(bno);
		model.addAttribute("dto", dto);
		return "free_update";
	}
	@RequestMapping("/allserach.do")
	public String allserach(Model model,@RequestParam("find_name") String find_name) {
		List<BoardDTO> list1= this.dao.searchBoard(find_name);
		List<PlaceDTO> list2 = this.dao.searchPlace(find_name);
		List<ProductDTO> list3 = this.dao.searchProduct(find_name);
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		
		
		return "allserach";
	}

}
