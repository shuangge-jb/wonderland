package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.model.Address;
import com.service.AddressService;
/**
 * 
 * @author Fang
 *@管理地址的类，包含获取保存的地址列表，增加或者删除地址。
 */
@Controller
@RequestMapping("/address")
@SessionAttributes({"userId"})
public class AddressController {
	@Resource
	private AddressService addressService;

	@RequestMapping(value = "/getAddressList.do", method = RequestMethod.GET)
	public String getAddressList(@RequestParam("userId") Integer userId, Model model) {
		List<Address> addrestList = addressService.getAddressList(userId);
		model.addAttribute("addressList", addrestList);
		model.addAttribute("userId", userId);
		return "myAddress";
	}
	@RequestMapping(value = "/getAddressList1.do", method = RequestMethod.GET)
	public String getAddressList1(@RequestParam("userId") Integer userId, Model model) {
		List<Address> addrestList = addressService.getAddressList(userId);
		model.addAttribute("addressList", addrestList);
		model.addAttribute("userId", userId);
		return "myAddress1";
	}
	@RequestMapping(value = "/deleteAddress.do", method = RequestMethod.GET)
	public String deleteAddress(@ModelAttribute("userId") Integer userId, @RequestParam("id") Integer id, Model model) {
		addressService.deleteAddress(userId, id);
		return "redirect:getAddressList.do";
	}

	@RequestMapping(value = "/getAddress.do", method = RequestMethod.GET)
	public String getAddress(@ModelAttribute("userId") Integer userId, @RequestParam("id") Integer id, Model model) {
		Address address = addressService.getAddress(userId, id);
		model.addAttribute("address", address);
		return "getAddress";
	}

	@RequestMapping(value = "/edit.do", method = RequestMethod.GET)
	public String edit(@ModelAttribute("userId") Integer userId,
			@RequestParam(value = "id", required = false) Integer id, Model model) {	
		if (userId != null && id != null) {
			Address address = addressService.getAddress(userId, id);
			if(address!=null){
				model.addAttribute("address", address);
			}
		}
		return "editAddress";
	}
	@RequestMapping(value = "/editAddress.do", method = RequestMethod.POST)
	public String editAddress(@ModelAttribute("userId") Integer userId,@ModelAttribute("address") Address address) {
		System.out.println(address);
		address.setUserId(userId);
		addressService.saveOrUpdate(address);
		return "redirect:getAddressList.do";
	}
}
