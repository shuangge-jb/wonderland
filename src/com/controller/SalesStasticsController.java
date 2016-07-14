package com.controller;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.service.CollectService;
import com.service.SalesStasticService;

@Controller
@RequestMapping("/SalesSta")
@SessionAttributes("json")
public class SalesStasticsController {
	@Resource
	private SalesStasticService salesStasticService;

	public SalesStasticService getSalesStasticService() {
		return salesStasticService;
	}

	public void setSalesStasticService(SalesStasticService salesStasticService) {
		this.salesStasticService = salesStasticService;
	}
	@RequestMapping(value="selectSalesStastics.do",method = RequestMethod.GET)
	public ModelAndView selectSalesStastics(){
		ModelAndView mv=new ModelAndView();
		/*JSONArray json = JSONArray.fromObject(map);*/
	    JSONArray json=salesStasticService.getAllClassNumRes();
	    String [] A={"童书","文艺","人文社科",
				"经管","教育","励志","科技","生活"
		};
	    int total=salesStasticService.getTotalSalesBook(A);
		mv.addObject("jsondata",json);
		mv.addObject("total",total);
		System.out.println("******"+json);
		mv.setViewName("statistics");
		return mv;
	}

}
