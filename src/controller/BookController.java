package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.NaverBookService;

@Controller
public class BookController {
	@Autowired
	private NaverBookService service;
	
	@RequestMapping("bookList.do")
	public ModelAndView bookList(@RequestParam(required=false)String keyword) {
		ModelAndView mav = new ModelAndView(); 
		if(keyword != null) {
			mav.addObject("bookList", service.searchBook(keyword, 10, 1));
		}
		mav.setViewName("bookList");
		return mav;
	}
}
