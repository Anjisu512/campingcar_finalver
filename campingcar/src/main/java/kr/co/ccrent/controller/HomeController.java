package kr.co.ccrent.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.ccrent.service.CarService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private final CarService carService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@GetMapping(value={"/",""})
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("carlist", carService.getAll());
		return "home";
	}
	
	@GetMapping("/html/direction")
	public void directionGET() {
		System.out.println("<Home Controller> direction GET");
	}
	@GetMapping("/html/intro")
	public void introGET() {
		System.out.println("<Home Controller> intro GET");
	}	
	
}
