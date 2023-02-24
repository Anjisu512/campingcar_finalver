package kr.co.ccrent.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ccrent.config.DateProcess;
import kr.co.ccrent.dto.CarDTO;
import kr.co.ccrent.dto.CarUserDTO;
import kr.co.ccrent.dto.RentDTO;
import kr.co.ccrent.service.CarService;
import kr.co.ccrent.service.RentService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/rent")
@RequiredArgsConstructor
public class RentController {

	private final RentService rentService;
	private final CarService carService;
	private final DateProcess dateProcess; 
	
	@GetMapping("/list")
	public void listGET(String curYear, String curMon, Model model) {
		System.out.println("<Controller> rent list GET");
		HashMap<String, Object> datemap = dateProcess.dateCalculate(curYear, curMon, 0);
		HashMap<Integer, Object> maplist = new HashMap<>();
		HashMap<String, Object> varmap = new HashMap<>();
		List<CarDTO> carlist = carService.getAll(); 
		System.out.println(datemap.get("firstday"));
		System.out.println(datemap.get("lastday"));
		for(int i=0; i<carlist.size(); i++) {
			varmap.clear();
			varmap.put("car_regid", carlist.get(i).getCar_regid());
			System.out.println("차 번호 : "+carlist.get(i).getCar_regid());
			varmap.put("firstday", datemap.get("firstday"));
			varmap.put("lastday", datemap.get("lastday"));	
			varmap.put("dummy", "1");				
			maplist.put(carlist.get(i).getCar_regid(), rentService.getByCarId(varmap));
		}
		model.addAttribute("maplist", maplist);
		model.addAttribute("carlist", carService.getAll());
	}
	
	@GetMapping("/register")
	public void registerGET(Model model, int car_regid) {
		System.out.println("<Controller> rent register GET");
		System.out.println("car_regid : "+car_regid);
		model.addAttribute("carlist", carService.getAll());
		model.addAttribute("car", carService.getOne(car_regid));
		HashMap<String, Object> datemap = dateProcess.dateCalculate(null, null, 1);
		HashMap<String, Object> varmap = new HashMap<>();
		varmap.put("car_regid", car_regid);
		varmap.put("firstday", datemap.get("firstday"));
		varmap.put("lastday", datemap.get("lastday"));
		varmap.put("dummy", "1");	
		HashMap<String, RentDTO> map = rentService.getByCarId(varmap);
		model.addAttribute("rentlist", map);
	}
	@PostMapping("/register")
	public String registerPOST(RentDTO rentDTO) {
		System.out.println("<Controller> rent register POST");
		System.out.println(rentDTO);
		rentService.register(rentDTO);
		return "redirect:/rent/list";
	}
	@ResponseBody
	@PostMapping("/datecheck")
	public int datecheckPOST (RentDTO rentDTO) {
		System.out.println("<Rent Controller> datecheck POST");
		System.out.println(rentDTO);
		HashMap<String, Object> varmap = new HashMap<>();
		varmap.put("car_regid", rentDTO.getCar_regid());
		varmap.put("rent_startdate", rentDTO.getRent_startdate());
		varmap.put("rent_enddate", rentDTO.getRent_enddate());
		RentDTO resultDTO = rentService.getDateRedundancy(varmap);
		System.out.println("예약 날짜 중복 확인 중");
		System.out.println(resultDTO);
		int result = 0;
		if(resultDTO!=null) {
			result = resultDTO.getRent_id();
		}
		return result;
	}	
	@GetMapping("/read")
	public void readGET(HttpSession session, Model model) {
		System.out.println("<Rent Controller> read GET");
		System.out.println(session.getAttribute("user"));
		CarUserDTO carUserDTO = (CarUserDTO) session.getAttribute("user");
		if(carUserDTO==null) {
			System.out.println("guest");
		}else {
			System.out.println("member login");
			String car_uid = carUserDTO.getCar_uid();
			model.addAttribute("dtolist", rentService.getMember(car_uid));
		}

	}
	@PostMapping("/read")
	public void readPOST(RentDTO rentDTO, Model model) {
		System.out.println("<Rent Controller> read POST");
		System.out.println(rentDTO);
		model.addAttribute("dtolist", rentService.getGuest(rentDTO));
		model.addAttribute("check", 1);
	}
	@PostMapping("/cancel")
	public String cancelPOST(RentDTO rentDTO, RedirectAttributes redirectAttributes) {
		System.out.println("<Rent Controller> cancel POST");
		System.out.println(rentDTO);
		rentService.modifyCancel(rentDTO);
		redirectAttributes.addFlashAttribute("result", "cancel");
		return "redirect:/rent/read";
	}
	
	@GetMapping("/template")
	public void templateGET() {
		
	}
}
