package in.co.rays.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// TODO: Auto-generated Javadoc
/**
 * The Class WelcomeCtl.
 */
@Controller
@RequestMapping("/Welcome")
public class WelcomeCtl {
	
	/**
	 * Display.
	 *
	 * @param model the model
	 * @return the string
	 */
	@RequestMapping(method=RequestMethod.GET)
	public String display(ModelMap model) 
	{
		System.out.println("hello welcome");

		String msg = "This is Welcome Page";
		System.out.println("display");
		model.addAttribute("message", msg);
		return "Welcome";
	}
}
