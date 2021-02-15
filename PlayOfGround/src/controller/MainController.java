package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public ModelAndView MainView(ModelAndView mv) throws Exception {
//		mv.setViewName("index");
//		 return mv;
//	}
	@RequestMapping("/")
	public String index() {
		return "index";
	}
}
