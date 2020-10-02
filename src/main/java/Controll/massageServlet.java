package Controll;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Dao.sendMailDao;
import Model.sendmail;

@Controller
@RequestMapping(value="massage")
public class massageServlet {
	
	@RequestMapping(value="index" , method=RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return new ModelAndView ("redirect:/index.jsp");
	}
	
	@RequestMapping(value="view" , method=RequestMethod.GET)
	public ModelAndView massageview(HttpServletRequest request,HttpServletResponse response) throws Exception{
		return new ModelAndView("massage/massageview");
	}
	
	@RequestMapping(value="send" , method=RequestMethod.POST)
	public ModelAndView massagesend(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		
		String Sub = request.getParameter("type");
		String Name = request.getParameter("name");
		String Sex = request.getParameter("sex");
		String Phone = request.getParameter("phone");
		String Note = request.getParameter("note");
		String Mail = request.getParameter("mail");
		
		sendmail sm = new sendmail();
		sm.setSub(Sub);
		sm.setName(Name);
		sm.setSex(Sex);
		sm.setPhone(Phone);
		sm.setMail(Mail);
		sm.setNote(Note);
		sm.setPdate(new Date());
		
		new sendMailDao().add(sm);
		
		new sendMailDao().getSend(sm);
		
		
		return new ModelAndView("redirect:/massage/sok");
	}
	
	@RequestMapping(value="sok" , method=RequestMethod.GET)
	public ModelAndView massageok(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		
		return new ModelAndView ("redirect:../sendok.jsp");
	}
}
