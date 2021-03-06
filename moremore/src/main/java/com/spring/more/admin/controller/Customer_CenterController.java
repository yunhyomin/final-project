package com.spring.more.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.FormSubmitEvent.MethodType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.more.admin.service.AdminPaging;
import com.spring.more.admin.service.Customer_CenterService;
import com.spring.more.admin.service.Customer_CenterVO;
import com.spring.more.project.service.ProjectVO;
import com.spring.more.users.service.UsersVO;


@Controller
public class Customer_CenterController {
	@Autowired
	private Customer_CenterService customer_CenterService;
	
	public Customer_CenterController() {
		System.out.println(">> :: Customer_CenterController()객체 생성");
	}
	//회원현황 , 프로젝트현황 , 매출현황
	@RequestMapping("/getAdminMain.do")
	@ResponseBody
	public Map<String, Object> AdminMain(Model model){
		System.out.println("> Controller에서 AdminMain()실행");
		Map<String, Object> AdminMain = customer_CenterService.adminMain();
		System.out.println(AdminMain.toString());
		return AdminMain;
	}	
	//회원검색 
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		System.out.println("searchConditionMap()실행");
		Map<String, String> conditionMap = new HashMap<String,String>();
		conditionMap.put("아이디","USER_ID");
		conditionMap.put("이름","USER_NAME");
		conditionMap.put("PHONE","USER_PHONE");
		conditionMap.put("EMAIL","USER_EMAIL");
		conditionMap.put("성별","USER_GENDER");
		conditionMap.put("주소", "USER_ADDRESS");
		conditionMap.put("회원구분", "USER_TYPE");
		//conditionMap.put("가입일","USER_JOINDATE");

		return conditionMap;
	}
	//회원리스트 불러오기
	@RequestMapping("/getUserList.do")
	public String userList(@RequestParam(value="cPage", required = false) String cPage, Model model, UsersVO vo, HttpServletRequest req){
		System.out.println("Contoroller > getUserList()실행");
		System.out.println(vo);
		
		//-----------목록 , 페이징 구현 ----------------
		//페이징을 위한 객체 생성 
		AdminPaging p = new AdminPaging();
		
		// 1. 전체 게시물 수량구하기 
		int cntTot = customer_CenterService.cntTot();
		p.setTotalRecord(cntTot);
		p.setTotalPage();
		System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());//총 게시물 갯수
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());//전체 페이지 갯수
		
		//2.현재페이지 구하기 
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));//@RequestParam 으로 받은 현재페이지 정보
		}
		System.out.println("> cPage : " + cPage);
		System.out.println("> paging nowPage : " + p.getNowPage());//현재페이지
		
		//3.현재페이지에  표시할 게시글 시작번호, 끝번호 구하기 
		if(p.getTotalRecord() < 10) {
			p.setNumPerPage(p.getTotalRecord());
			////표시되는 게시물 갯수(10) 보다 총 게시물 갯수가 적으면 
			//총 게시물 갯수가 NumPerPage(표시되는 게시물 갯수)가 되게
		}else {
			p.setNumPerPage(10);
		}
		System.out.println("--->>p.getNumPerPage() : " + p.getNumPerPage());
		vo.setEnd(p.getNowPage() * p.getNumPerPage()); // 현재페이지 * 페이지당게시글 수
		vo.setBegin(vo.getEnd() - p.getNumPerPage() + 1); // 끝페이지 - 페이지당게시글 수

		if (vo.getEnd() <= 1) { // 마지막 게시글번호가 총 게시글 수와 같게
			vo.setEnd(p.getTotalRecord());
		}

		System.out.println(">>시작번호(begin) : " + vo.getBegin()); // 현재페이지번호 * 페이지당게시글 수
		System.out.println(">>끝번호(end) : " + vo.getEnd());
		System.out.println("Integer.toString(p.getBegin()) : " + Integer.toString(vo.getBegin()));

		// (선택적) 3-1. 끝번호가 데이터 건수보다 많아지면 데이터 건수와 동일한 번호로 설정
		if (vo.getEnd() > p.getTotalRecord()) {
			vo.setEnd(p.getTotalRecord());
		}
		if (vo.getEnd() == 0)
			vo.setEnd(1);
		System.out.println(">>시작번호(begin) : " + vo.getBegin()); // 현재페이지번호 * 페이지당게시글 수
		System.out.println(">>끝번호(end) : " + vo.getEnd());

		System.out.println(">>p.getPagePerBlock() : " + p.getPagePerBlock());
		
		// ----------- 볼록 계산하기 ------------------
		// 4. 볼록의 시작페이지,끝페이지 구하기
		// 시작페이지 구하기
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		if (p.getTotalRecord() < 100) {
			p.setEndPage(p.getTotalPage());
		}
		
		// 4-1
		// 4-1. 끝페이지(endPage)가 전체페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}

		System.out.println(">> beginPage : " + p.getBeginPage());
		System.out.println(">> endPage : " + p.getEndPage());

		// ------------------------
		System.out.println(vo);
		
		List<UsersVO> userList  = customer_CenterService.getUserList(vo);
		System.out.println(userList);
		model.addAttribute("userList",userList);
		model.addAttribute("cntTot",cntTot);
		model.addAttribute("pvo",p);
		System.out.println("paging:"+p);
		
		return "adminUsersManage.jsp";
	}
	
	//프로젝트 검색 
	@ModelAttribute("searchMap")
	public Map<String , String> searchProj(){
		System.out.println("searchProj()실행");
		Map<String, String> searchMap = new HashMap<String,String>();
		searchMap.put("프로젝트 번호", "PRO_NO");
		searchMap.put("제목", "PRO_TITLE");
		
		return searchMap;
	}
	//프로젝트 리스트 불러오기 
	@RequestMapping("/getProj.do")
	public String projList(@RequestParam(value="cPage",required=false) String cPage,Model model, ProjectVO vo) {
		System.out.println("Controller > projList()실행");
		///=======목록, 페이징 구현 --------------------------------
		//페이징을 위한 객체 생성
		AdminPaging p = new AdminPaging();
		
		// 1. 전체게시물 수량구하기
				p.setTotalRecord(customer_CenterService.getProjectCnt()); 
				p.setTotalPage();
				System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());//총 게시물 갯수
				System.out.println("> 전체 페이지 수 : " + p.getTotalPage());//전체 페이지 갯수

				// 2. 현재페이지 구하기
				if (cPage != null) {
					p.setNowPage(Integer.parseInt(cPage));//@RequestParam 으로 받은 현재페이지 정보
				}
				System.out.println("> cPage : " + cPage);
				System.out.println("> paging nowPage : " + p.getNowPage());//현재페이지

				// 3. 현재페이지에 표시할 게시글 시작번호,끝번호 구하기
				if (p.getTotalRecord() < 10) { 
					p.setNumPerPage(p.getTotalRecord());
					//표시되는 게시물 갯수(10) 보다 총 게시물 갯수가 적으면 
					//총 게시물 갯수가 NumPerPage(표시되는 게시물 갯수)가 되게
				} else {
					p.setNumPerPage(10); //표시되는 게시물 갯수(10) 이상이면 10으로 설정
				}
				System.out.println("--->>p.getNumPerPage() : " + p.getNumPerPage());
				vo.setEnd(p.getNowPage() * p.getNumPerPage()); // 현재페이지 * 페이지당게시글 수
				vo.setBegin(vo.getEnd() - p.getNumPerPage() + 1); // 끝페이지 - 페이지당게시글 수
				if (vo.getEnd() <= 1) { // 마지막 게시글번호가 총 게시글 수와 같게
					vo.setEnd(p.getTotalRecord());
				}

				System.out.println(">>시작번호(begin) : " + vo.getBegin()); // 현재페이지번호 * 페이지당게시글 수
				System.out.println(">>끝번호(end) : " + vo.getEnd());
				System.out.println("Integer.toString(p.getBegin()) : " + Integer.toString(vo.getBegin()));

				// (선택적) 3-1. 끝번호가 데이터 건수보다 많아지면 데이터 건수와 동일한 번호로 설정
				if (vo.getEnd() > p.getTotalRecord()) {
					vo.setEnd(p.getTotalRecord());
				}
				if (vo.getEnd() == 0)
					vo.setEnd(1);
				System.out.println(">>시작번호(begin) : " + vo.getBegin()); // 현재페이지번호 * 페이지당게시글 수
				System.out.println(">>끝번호(end) : " + vo.getEnd());

				System.out.println(">>p.getPagePerBlock() : " + p.getPagePerBlock());

				// ----------- 볼록 계산하기 ------------------
				// 4. 볼록의 시작페이지,끝페이지 구하기
				// 시작페이지 구하기
				int nowPage = p.getNowPage();
				int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
				p.setBeginPage(beginPage);
				p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
				if (p.getTotalRecord() < 100) {
					p.setEndPage(p.getTotalPage());
				}

				// 4-1
				// 4-1. 끝페이지(endPage)가 전체페이지 수(totalPage) 보다 크면
				// 끝페이지를 전체페이지 수로 변경 처리
				if (p.getEndPage() > p.getTotalPage()) {
					p.setEndPage(p.getTotalPage());
				}

				System.out.println(">> beginPage : " + p.getBeginPage());
				System.out.println(">> endPage : " + p.getEndPage());

				// ------------------------
				System.out.println("-------------------Controller: ProjectVO:"+vo);
				List<ProjectVO> list = customer_CenterService.getProjectList(vo);
				model.addAttribute("projectList",list);
				model.addAttribute("pvo",p);
				
				return "adminProjectManage.jsp";
	}
	
	//프로젝트 상세보기 
	@RequestMapping("getProjDetail.do")
	@ResponseBody
	public ProjectVO getProj(ProjectVO vo) {
		System.out.println("Controller > getProj()실행");
		ProjectVO pro = customer_CenterService.getProj(vo);
		
		return pro;
	}
	
	//고객센터 검색 
	@ModelAttribute("searchNotice")
	public Map<String, String> searchCustomerCenter(){
		System.out.println("searchNotice()실행");
		Map<String,String> searchNotice = new HashMap<String,String>();
		searchNotice.put("공지사항", "공지사항");
		searchNotice.put("FAQ", "FAQ");
		
		return searchNotice;
	}
	
	//고객센터 리스트 불러오기 
	@RequestMapping("notice.do")
	public String customerCenterList(@RequestParam(value="cPage",required=false)String cPage, Model model,Customer_CenterVO vo) {
		System.out.println("customerCenterList()시작");
		System.out.println(vo.toString());
		
		/// ---------- 목록, 페이징 구현 -------------
				// 페이징을 위한 객체 생성
				AdminPaging p = new AdminPaging();

				// 1. 전체게시물 수량구하기
				p.setTotalRecord(customer_CenterService.cntNotice());
				p.setTotalPage();
				System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());//총 게시물 갯수
				System.out.println("> 전체 페이지 수 : " + p.getTotalPage());//전체 페이지 갯수

				// 2. 현재페이지 구하기
				if (cPage != null) {
					p.setNowPage(Integer.parseInt(cPage));//@RequestParam 으로 받은 현재페이지 정보
				}
				System.out.println("> cPage : " + cPage);
				System.out.println("> paging nowPage : " + p.getNowPage());//현재페이지

				// 3. 현재페이지에 표시할 게시글 시작번호,끝번호 구하기
				if (p.getTotalRecord() < 10) { 
					p.setNumPerPage(p.getTotalRecord());
					//표시되는 게시물 갯수(10) 보다 총 게시물 갯수가 적으면 
					//총 게시물 갯수가 NumPerPage(표시되는 게시물 갯수)가 되게
				} else {
					p.setNumPerPage(10); //표시되는 게시물 갯수(10) 이상이면 10으로 설정
				}
				System.out.println("--->>p.getNumPerPage() : " + p.getNumPerPage());
				vo.setEnd(p.getNowPage() * p.getNumPerPage()); // 현재페이지 * 페이지당게시글 수
				vo.setBegin(vo.getEnd() - p.getNumPerPage() + 1); // 끝페이지 - 페이지당게시글 수

				if (vo.getEnd() <= 1) { // 마지막 게시글번호가 총 게시글 수와 같게
					vo.setEnd(p.getTotalRecord());
				}

				System.out.println(">>시작번호(begin) : " + vo.getBegin()); // 현재페이지번호 * 페이지당게시글 수
				System.out.println(">>끝번호(end) : " + vo.getEnd());
				System.out.println("Integer.toString(p.getBegin()) : " + Integer.toString(vo.getBegin()));

				// (선택적) 3-1. 끝번호가 데이터 건수보다 많아지면 데이터 건수와 동일한 번호로 설정
				if (vo.getEnd() > p.getTotalRecord()) {
					vo.setEnd(p.getTotalRecord());
				}
				if (vo.getEnd() == 0)
					vo.setEnd(1);
				System.out.println(">>시작번호(begin) : " + vo.getBegin()); // 현재페이지번호 * 페이지당게시글 수
				System.out.println(">>끝번호(end) : " + vo.getEnd());

				System.out.println(">>p.getPagePerBlock() : " + p.getPagePerBlock());

				// ----------- 볼록 계산하기 ------------------
				// 4. 볼록의 시작페이지,끝페이지 구하기
				// 시작페이지 구하기
				int nowPage = p.getNowPage();
				int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
				p.setBeginPage(beginPage);
				p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
				if (p.getTotalRecord() < 100) {
					p.setEndPage(p.getTotalPage());
				}

				// 4-1
				// 4-1. 끝페이지(endPage)가 전체페이지 수(totalPage) 보다 크면
				// 끝페이지를 전체페이지 수로 변경 처리
				if (p.getEndPage() > p.getTotalPage()) {
					p.setEndPage(p.getTotalPage());
				}

				System.out.println(">> beginPage : " + p.getBeginPage());
				System.out.println(">> endPage : " + p.getEndPage());
				System.out.println("---user.getUser_no()--- : " + vo.getUser_no());

				// ------------------------

				model.addAttribute("pvo", p);
				model.addAttribute("cPage", cPage);

				List<Customer_CenterVO> list = customer_CenterService.centerList(vo);
				model.addAttribute("noticeList",list);
		
				return "noticeAndhelpCenter.jsp";
	}
	
	//공지사항 등록하기 
	@RequestMapping(value="/insertNotice.do",method = RequestMethod.POST)
	public String insertNotice(Customer_CenterVO vo, MultipartHttpServletRequest mr,HttpSession session) throws IllegalStateException, IOException {
		System.out.println("insertNotice()시작");
		vo.setUser_no(String.valueOf(session.getAttribute("admin")));
		
		System.out.println("vo: "+vo);
		
		List<MultipartFile> uploadFile = mr.getFiles("customer_imagee");
		String name = "";
		for(MultipartFile mf : uploadFile) {
			String filename = mf.getOriginalFilename();
			System.out.println(filename);
			name += "^images/" + filename;
			mf.transferTo(new File("C:\\MyStudy\\70_spring\\moremore\\moremore\\src\\main\\webapp\\resources\\images\\"+filename));
			
		}
		vo.setCustomer_image(name.substring(1));
		customer_CenterService.insertNotice(vo);
		
		return "notice.do";
	}
	//공지사항 상세보기 
	@RequestMapping("detailNotice.do")
	@ResponseBody
	public Customer_CenterVO detailNotice(Customer_CenterVO vo) {
		System.out.println("detailNotice()시작");
		System.out.println(vo);
		
		Customer_CenterVO detailNotice = customer_CenterService.detailNotice(vo);
		return detailNotice;
	}
	
	//공지사항 수정하기 
	@RequestMapping(value="/updateNotice.do", method=RequestMethod.POST)
	public String updateNotice(Model model, MultipartHttpServletRequest mr, Customer_CenterVO vo) throws IllegalStateException, IOException {
		System.out.println("updateNotice()시작");
		System.out.println(vo);
		
		List<MultipartFile> uploadFile = mr.getFiles("customer_imagee");
		String name = "";
		for(MultipartFile mf : uploadFile) {
			String filename = mf.getOriginalFilename();
			System.out.println(filename);
			name += "^images/"+ filename;
			mf.transferTo(new File("C:\\MyStudy\\70_spring\\moremore\\moremore\\src\\main\\webapp\\resources\\images\\"+filename));
		}
		vo.setCustomer_image(name.substring(1));
		customer_CenterService.updateNotice(vo);
		 model.addAttribute("customer_no",vo.getCustomer_no());
		
		 return "detailNotice.jsp";
	}
	//공지사항 삭제 
	@RequestMapping("deleteNotice.do")
	public String deleteNotice(Customer_CenterVO vo) {
		System.out.println("deleteNotice()실행");
		System.out.println(vo);
		customer_CenterService.deleteNotice(vo);
		
		return "notice.do";
	}
	//--------------------------
	
	//기간별 검색
	@RequestMapping("datePick.do")
	@ResponseBody
	public Map<String, Object> sales(HttpServletRequest req){
		System.out.println("sales()실행");
		Map<String,String> date = new HashMap<String,String>();
		date.put("startDate",req.getParameter("startDate"));
		date.put("endDate",req.getParameter("endDate"));
		
		Map<String, Object> map = customer_CenterService.datePick(date);
		
		return map;
	}
	
	
}








