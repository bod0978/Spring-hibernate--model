package Controll;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="booking")
public class bookServlet {
	
	//訂位頁面
	@RequestMapping(value="view" , method=RequestMethod.GET)
	public ModelAndView bookview (HttpServletRequest request,HttpServletResponse response) throws Exception{
		return new ModelAndView("member/booking");
	}
	
	//訂位查詢頁面
	@RequestMapping(value="query" , method=RequestMethod.GET)
	public ModelAndView bookquery (HttpServletRequest request,HttpServletResponse response) throws Exception{
		return new ModelAndView("member/bookquery");
	}
}
