package Controll;

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
import Model.FactModel;
import Model.staff;

@Controller
@RequestMapping(value="staff")
public class staffServlet {
	
	@RequestMapping(value="index" , method=RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return new ModelAndView ("redirect:/index.jsp");
	}
	
	//管理員login
	@RequestMapping(value="sin" ,method=RequestMethod.GET)
	public ModelAndView rootsin (HttpServletRequest request, HttpServletResponse response) throws Exception{

			return new ModelAndView("staff/sindex");
	}
	
	//員工login
	@RequestMapping(value="view" ,method=RequestMethod.GET)
	public ModelAndView staffview (HttpServletRequest request, HttpServletResponse response) throws Exception{

			return new ModelAndView("staff/login");
	}
	//功能頁面
	@RequestMapping(value="sel" ,method=RequestMethod.GET)
	public ModelAndView staffsel (HttpServletRequest request, HttpServletResponse response) throws Exception{

			return new ModelAndView("staff/sel");
	}
	@RequestMapping(value="login" ,method=RequestMethod.POST)
	public ModelAndView stafflogin (HttpServletRequest request, HttpServletResponse response) throws Exception{
			HttpSession session = request.getSession();
			String User = request.getParameter("user");
			String Pass = request.getParameter("password");
			
			ApplicationContext acd = implFactModel.acd;
			
			FactDao fd = acd.getBean("FD",FactDao.class);
			
			List l = fd.getSD().stalogin(User, Pass);
			
			//List l = new staffDao().stalogin(User, Pass);
			
			if(l.size() == 1) {

				Object o[] = l.toArray();
				
				ApplicationContext acm = implFactModel.acm;
				FactModel fm = acm.getBean("fm",FactModel.class);		
				
				staff sf = fm.getStaff();
				sf= (staff)o[0];
				
				if(sf.getType() == true ) {
					
					session.setAttribute("STAFF",sf);
					
					return new ModelAndView("redirect:/staff/sin");
				}else {

				session.setAttribute("STAFF",sf);
				return new ModelAndView("redirect:/staff/sel");
				}
			}else {
				return new ModelAndView("redirect:/staff/view");
			}
	}
		
	//員工管理
	@RequestMapping(value="mem" ,method=RequestMethod.GET)
	public ModelAndView staffmem (HttpServletRequest request, HttpServletResponse response) throws Exception{

			return new ModelAndView("staff/mem");
	}
	
	//新增員工資料
	@RequestMapping(value="addmem" ,method=RequestMethod.GET)
	public ModelAndView addstaff (HttpServletRequest request, HttpServletResponse response) throws Exception{

			return new ModelAndView("staff/addstaff");
	}
	
	//員工新增完成
		@RequestMapping(value="staffcheck" ,method=RequestMethod.POST)
		public ModelAndView staffcheck (HttpServletRequest request, HttpServletResponse response) throws Exception{
			request.setCharacterEncoding("utf-8");
			
			String user = request.getParameter("user");
			
			ApplicationContext acd = implFactModel.acd;
			ApplicationContext acm = implFactModel.acm;
			FactDao FD = acd.getBean("FD",FactDao.class);
			FactModel FM = acm.getBean("fm",FactModel.class);
			
			List l = FD.getSD().checkstaff(user);
			
			if(l.size() == 1) {
				
				return new ModelAndView("staff/addstaff");
				
			}else {
				int type = Integer.parseInt(request.getParameter("type"));
				FM.getStaff().setUser(user);
				FM.getStaff().setName(request.getParameter("name"));
				FM.getStaff().setPassword( request.getParameter("password"));
				FM.getStaff().setMail(request.getParameter("mail"));
				FM.getStaff().setPhone( request.getParameter("phone"));
				FM.getStaff().setAddress( request.getParameter("address"));
				
				java.sql.Date Body = java.sql.Date.valueOf(request.getParameter("body"));
				java.sql.Date working = java.sql.Date.valueOf(request.getParameter("work"));
				
				FM.getStaff().setBody(Body);
				FM.getStaff().setWorking(working);
				
				if(type == 1) {
					FM.getStaff().setType(true);
				}else {
				
					FM.getStaff().setType(false);
				}
				
				FD.getSD().add(FM.getStaff());
				
			//	System.out.println(FM.getStaff().getType());
				
					return new ModelAndView("redirect:addmemok");
			}

		}
	
	//員工新增完成
	@RequestMapping(value="addmemok" ,method=RequestMethod.GET)
	public ModelAndView addstaffok (HttpServletRequest request, HttpServletResponse response) throws Exception{

			return new ModelAndView("staff/addstaffok");
	}
	
	
	//員工資料更新查看
	@RequestMapping(value="upsee" ,method=RequestMethod.GET)
	public ModelAndView upsee (HttpServletRequest request, HttpServletResponse response) throws Exception{

			return new ModelAndView("staff/upsee");
	}
	//員工資料更新
	@RequestMapping(value="upstaff" ,method=RequestMethod.GET)
	public ModelAndView upstaff (HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		ApplicationContext acm = implFactModel.acd;
		
		FactDao fd = acm.getBean("FD",FactDao.class);
		
		Object o = fd.getSD().query(id);
		
		
		HttpSession session = request.getSession();
		
		session.setAttribute("STA", o );
		
			return new ModelAndView("staff/upstaff");
	}
	
	//更新資料完成
	@RequestMapping(value="upstaffok" ,method=RequestMethod.POST)
	public ModelAndView upstaffok (HttpServletRequest request, HttpServletResponse response) throws Exception{
		//更新頁面接收值
		HttpSession session = request.getSession();
		 staff sf = (staff)session.getAttribute("STA");
		String Name = request.getParameter("name");	
		String Pass = request.getParameter("password");	
		String Phone = request.getParameter("phone");
		String Mail = request.getParameter("mail");
		String Addr = request.getParameter("address");
		int Type =Integer.parseInt( request.getParameter("type") );
		//轉型為SQL的DATE
		java.sql.Date Body = java.sql.Date.valueOf(request.getParameter("body"));
		
		//工廠模式呼叫Model  
		ApplicationContext acm = implFactModel.acm;
		//將接收的值放入staff 的class
		FactModel fm = acm.getBean("fm",FactModel.class);
		fm.getStaff().setName(Name);
		fm.getStaff().setPassword(Pass);
		fm.getStaff().setPhone(Phone);
		fm.getStaff().setMail(Mail);
		fm.getStaff().setAddress(Addr);
		fm.getStaff().setId(sf.getId());
		fm.getStaff().setWorking(sf.getWorking());
		fm.getStaff().setUser(sf.getUser());
		if(Type == 1) {
			fm.getStaff().setType(true);
		}else {
			fm.getStaff().setType(false);
		}
			
		fm.getStaff().setBody(Body);
		
		//工廠模式呼叫Dao
		ApplicationContext acd = implFactModel.acd;
		//使用staffDao裡的 update()方法
		FactDao fd = acd.getBean("FD",FactDao.class);
		//將 staff 放入  update 進入資料庫
		fd.getSD().update(fm.getStaff());
		//轉跳更新畫面
		return new ModelAndView("staff/upsee");
	}
	
	
	//員工資料刪除
	@RequestMapping(value="delstaff" ,method=RequestMethod.GET)
	public ModelAndView deltaff (HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		ApplicationContext acm = implFactModel.acm;
		
		FactModel fm = acm.getBean("fm", FactModel.class);
		
		fm.getStaff().setId(id);
		
		ApplicationContext acd = implFactModel.acd;
		
		FactDao fd = acd.getBean("FD", FactDao.class);
		
		fd.getSD().delete(fm.getStaff());
		
			return new ModelAndView("staff/upsee");
	}

	//簡訊管理
	@RequestMapping(value="mass" ,method=RequestMethod.GET)
	public ModelAndView staffmass (HttpServletRequest request, HttpServletResponse response) throws Exception{

			return new ModelAndView("staff/mass");
	}
	//菜色管理
	@RequestMapping(value="food" ,method=RequestMethod.GET)
	public ModelAndView stafffood (HttpServletRequest request, HttpServletResponse response) throws Exception{

			return new ModelAndView("staff/food");
	}
	//定位管理
	@RequestMapping(value="ord" ,method=RequestMethod.GET)
	public ModelAndView stafford (HttpServletRequest request, HttpServletResponse response) throws Exception{

			return new ModelAndView("staff/ord");
	}

}
