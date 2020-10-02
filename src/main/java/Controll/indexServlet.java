package Controll;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="index")
public class indexServlet {
	
	@RequestMapping(value="index" , method=RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return new ModelAndView ("redirect:/index.jsp");
	}
	
	@RequestMapping(value="about" , method=RequestMethod.GET)
	public ModelAndView about(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return new ModelAndView ("about/about");
	}
	
	@RequestMapping(value="news" , method=RequestMethod.GET)
	public ModelAndView news(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return new ModelAndView ("news/news");
	}
	
	@RequestMapping(value="ajax" , method=RequestMethod.POST)
	public ModelAndView ajax (HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
		
		String user = request.getParameter("user");
					
		Session se = Dao.implDao.getSe();

		Query q = se.createQuery("from  member where user='"+user+"' ");
		List l = q.list();
		
		System.out.println(l.size()+"輸出的職");
			if(l.size() == 1){
				
				 response.getWriter().print("您的使用者名稱已經註冊");
			}
			else{
				
				response.getWriter().print("驗證成功");
			}
			return null;
		}

	
}
