package Controll;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="sindex")
public class rootServlet {
	
	@RequestMapping(value="index")
	public ModelAndView index (HttpServletRequest request,HttpServletResponse response) throws Exception{
		return new ModelAndView("sindex/index");
	}
}
