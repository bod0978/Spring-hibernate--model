package Controll;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="food")
public class foodServlet {
	
	@RequestMapping(value="index" , method=RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return new ModelAndView ("redirect:/index.jsp");
	}
	
	@RequestMapping(value="view" , method=RequestMethod.GET)
	public ModelAndView foodview(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return new ModelAndView ("food/foodview");
	}
	
	
	
}
