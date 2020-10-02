package Controll;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Dao.FactDao;
import Dao.memberDao;
import Model.FactModel;
import Model.member;

@Controller
@RequestMapping(value="mem")
public class memberServlet {
	
	@RequestMapping(value="index" , method=RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return new ModelAndView ("redirect:/index.jsp");
	}
	
	@RequestMapping(value="view" ,method=RequestMethod.GET)
	public ModelAndView memview (HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			HttpSession session = request.getSession();
			session.removeAttribute("M");
			session.removeValue("M");
			
			return new ModelAndView("member/mindex");
	}
	
	//會員註冊
	@RequestMapping(value="addm" ,method=RequestMethod.GET)
	public ModelAndView addm (HttpServletRequest request, HttpServletResponse response) throws Exception{
		
			return new ModelAndView("member/addm");
	}
	
	//登入成功
	@RequestMapping(value="loginok" ,method=RequestMethod.GET)
	public ModelAndView loginok (HttpServletRequest request, HttpServletResponse response) throws Exception{
		
			return new ModelAndView("member/login");
	}
		
	//會員註冊確認
	@RequestMapping(value="check" ,method=RequestMethod.POST)
	public ModelAndView check (HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		ApplicationContext acm = implFactModel.acm;
		ApplicationContext acd = implFactModel.acd;
		FactModel fm = acm.getBean("fm", FactModel.class);
		FactDao FD = acd.getBean("FD",FactDao.class);
		
		String User = request.getParameter("user");
		List l = FD.getMD().checkUser(User);
		
		//確認資料庫是否有重複帳號
		if(l.size() == 1) {
			//有的話
			return new ModelAndView("member/error");
			
		}else {
			//沒有的話
			String Pass = request.getParameter("password");
			String Name = request.getParameter("name");
			String Phone = request.getParameter("phone");
			String Addr = request.getParameter("address");
			String Sex = request.getParameter("sex");
			java.sql.Date Body = java.sql.Date.valueOf(request.getParameter("body"));
			String Mail = request.getParameter("mail");
						
			fm.getMember().setUser(User);
			fm.getMember().setPassword(Pass);
			fm.getMember().setName(Name);
			fm.getMember().setPhone(Phone);
			fm.getMember().setMail(Mail);
			fm.getMember().setSex(Sex);
			fm.getMember().setBady(Body);
			fm.getMember().setAddress(Addr);
						
			FD.getMD().add(fm.getMember());
			
			return new ModelAndView("redirect:../mem/conok");
		}
	}
	
	//註冊完成頁面
	@RequestMapping(value="conok" ,method=RequestMethod.GET)
	public ModelAndView confirm (HttpServletRequest request, HttpServletResponse response) throws Exception{

			return new ModelAndView("member/confirm");
	}
	
	//會員登入
	@RequestMapping(value="login" ,method=RequestMethod.POST)
	public ModelAndView login (HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String user = request.getParameter("user");
		String pass = request.getParameter("password");
		
		ApplicationContext acd = implFactModel.acd;
		ApplicationContext acm = implFactModel.acm;
		
		FactDao fd = acd.getBean("FD",FactDao.class);
		
		List l = fd.getMD().loginUser(user, pass);
		
		//List l = new memberDao().loginUser(user, pass);
		HttpSession session = request.getSession();
		//確認資料庫有無相同帳號密碼
		if(l.size() == 1 ) {
			//有的話
			Object o[] = l.toArray();
			
			FactModel fm = acm.getBean("fm",FactModel.class);
			member m = fm.getMember();
			
			m = (member)o[0];
			
			session.setAttribute("M", m);
			
			return new ModelAndView("redirect:../mem/loginok");
			
			
		}else {
			//沒有的話
			return new ModelAndView("redirect:../mem/view");	
		}
	}
	
	//會員資料修改頁面
	@RequestMapping(value="memupview" , method=RequestMethod.GET)
	public ModelAndView memupview (HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		return new ModelAndView("member/memupdate");
	}
		
	//會員資料修改
	@RequestMapping(value="update" , method=RequestMethod.POST)
	public ModelAndView memupdate (HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		
		ApplicationContext acm = implFactModel.acm;
		ApplicationContext acd = implFactModel.acd;
		FactModel fm = acm.getBean("fm", FactModel.class);
		FactDao FD = acd.getBean("FD",FactDao.class);
		
		member m = (member)session.getAttribute("M");
			
		String Pass = request.getParameter("password");
		String Name = request.getParameter("name");
		String Phone = request.getParameter("phone");
		String Addr = request.getParameter("address");
		String Sex = request.getParameter("sex");
		java.sql.Date Body = java.sql.Date.valueOf(request.getParameter("body"));
		String Mail = request.getParameter("mail");
		
		fm.getMember().setId(m.getId());
		fm.getMember().setUser(m.getUser());
		fm.getMember().setPassword(Pass);
		fm.getMember().setName(Name);
		fm.getMember().setPhone(Phone);
		fm.getMember().setMail(Mail);
		fm.getMember().setSex(Sex);
		fm.getMember().setBady(Body);
		fm.getMember().setAddress(Addr);
		
		FD.getMD().update(fm.getMember());
		
		return new ModelAndView("redirect:../mem/updateok");
	}
	
	//會員資料修改完成
	@RequestMapping(value="updateok" , method=RequestMethod.GET)
	public ModelAndView memupdateok (HttpServletRequest request,HttpServletResponse response) throws Exception {
								 
		return new ModelAndView("member/updateok");
	}
}
