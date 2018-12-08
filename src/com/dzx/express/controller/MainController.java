package com.dzx.express.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dzx.express.biz.*;
import com.dzx.express.entity.Express;
import com.dzx.express.entity.Log;
import com.dzx.express.entity.User;
import com.dzx.express.util.DateUtil;

@Controller
public class MainController {
	@Autowired
	ExpressBiz expressBiz;
	@Autowired
	LogBiz logBiz;
	@Autowired
	UserBiz userBiz;
	
	@RequestMapping(value="index")
	public String index(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@RequestMapping(value="addorder")
	public String addorder(Express express,HttpSession session) {
		express.setId(DateUtil.getId());
		express.setPosttime(new Date());
		express.setType("等待揽收");
		expressBiz.insertSelective(express);
		session.setAttribute("expid", express.getId());
		return "success";
	}
	
	@RequestMapping(value="showexp")
	public String showexp(String expid,HttpSession session) {
		Express express = expressBiz.selectByPrimaryKey(expid);
		if(express==null) {
			List<Express> expressList = expressBiz.selectbyphone(expid);
			if(expressList.size()==0) {
				session.setAttribute("msg", "没有此快递单号或手机号的记录，请核对后再次查询！");
				return "index";
			}
			session.setAttribute("expressList", expressList);
			return "success";
		}
		List<Log> logList = logBiz.selectlog(expid);
		session.setAttribute("express", express);
		session.setAttribute("logList", logList);
		return "orderinfo";
	}
	
	
	
	@RequestMapping(value="staff")
	public String staff() {
		return "login";
	}
	
	@RequestMapping(value="login")
	public String login(String username,String password,HttpSession session) {
		User user = userBiz.selectByPrimaryKey(username);
		if(!user.getPassword().equals(password)) {
			session.setAttribute("error", "工号或密码错误！");
			return "login";
		}
		session.setAttribute("loginUser", user);
		session.removeAttribute("msg");
		String lastname = user.getType().substring(user.getType().length()-1, user.getType().length());
		if(lastname.equals("仓")) {
			return "cangadmin";
		}
		if(user.getType().equals("admin")) {
			List<Express> orderList = expressBiz.selectall("");
			session.setAttribute("orderList", orderList);
			return "admin";
		}
		return "orderin";
	}
	
	@RequestMapping(value="orderin")
	public String orderin(String expid,HttpSession session) {
		session.removeAttribute("msg");
		Express express = expressBiz.selectByPrimaryKey(expid);
		if(express==null) {
			session.setAttribute("msg", "没有此快递单号的记录，请核对后再次操作！");
			return "orderin";
		}
		User user = (User) session.getAttribute("loginUser");
		Log log = new Log();
		log.setExpressid(expid);
		log.setTime(new Date());
		String type = express.getType().substring(0, 4);
		//System.out.println(type);
		if(type.equals("正在揽收")&&user.getType().equals("员工")) {
		log.setContext("揽收成功！");
		express.setType("已经揽收等待运输");
		session.setAttribute("msg", "操作成功！单号"+expid+"已经揽收");
		}else if(user.getType().equals("员工")){
			log.setContext("已签收");
			express.setType("已签收,请确认收货");
			session.setAttribute("msg", "操作成功！单号"+expid+"已经完成签收");
		}else {
			log.setContext(user.getType()+"已入库");
			express.setType("正在运输，当前位置："+user.getType());
			session.setAttribute("msg", "操作成功！单号"+expid+"已经入库");
		}
		expressBiz.updateByPrimaryKeySelective(express);
		logBiz.insert(log);
		
		return "orderin";
	}
	@RequestMapping(value="orderout")
	public String orderout(String expid,HttpSession session) {
		Express express = expressBiz.selectByPrimaryKey(expid);
		if(express==null) {
			session.setAttribute("msg", "没有此快递单号的记录，请核对后再次操作！");
			return "orderin";
		}
		User user = (User) session.getAttribute("loginUser");
		Log log = new Log();
		log.setExpressid(expid);
		log.setTime(new Date());
		if(express.getType().equals("等待揽收")&&user.getType().equals("快递员")) {
		
		session.setAttribute("msg", "操作有误请确认快递单号！");
		}else if(user.getType()!=null&&user.getType().equals("员工")){
			log.setContext("派件中，快递员："+user.getName()+",电话："+user.getPhone()+",请确保电话畅通！");
			express.setType("派件中，快递员："+user.getName()+"电话："+user.getPhone());
			session.setAttribute("msg", "操作成功！单号"+expid+"已经准备派件");
		}else {
			log.setContext(user.getType()+"已出库，发往下一目的地");
			express.setType("正在运输，之前位置："+user.getType());
			session.setAttribute("msg", "操作成功！单号"+expid+"已经出库");
		}
		expressBiz.updateByPrimaryKeySelective(express);
		logBiz.insert(log);
		
		return "orderin";
	}
	
	@RequestMapping(value="order")
	public void order(String expid,String staffid,HttpServletResponse res) throws IOException {
		res.setCharacterEncoding("utf-8");
		PrintWriter pw = res.getWriter();
		User user = userBiz.selectByPrimaryKey(staffid);
		if(user==null) {
			pw.write("0");
			return;
		}
		Log log = new Log();
		log.setContext("快递员："+user.getName()+"已出发,联系电话"+user.getPhone());
		log.setExpressid(expid);
		log.setTime(new Date());
		Express express = expressBiz.selectByPrimaryKey(expid);
		express.setType("正在揽收，快递员："+user.getName()+",电话："+user.getPhone());
		logBiz.insert(log);
		expressBiz.updateByPrimaryKeySelective(express);
		pw.write("已发出揽收通知！");
	}
	
	@RequestMapping(value="orderremove")
	public void orderremove(String expid) {
		expressBiz.deleteByPrimaryKey(expid);
	}
	
	@RequestMapping(value="confimorder")
	public String confimorder(String expid) {
		Express express = expressBiz.selectByPrimaryKey(expid);
		express.setType("已确认收货，感谢您的使用！");
		Log log = new Log();
		log.setContext("已确认收货，感谢您的使用！");
		log.setExpressid(expid);
		log.setTime(new Date());
		log.setType("0");
		logBiz.insertSelective(log);
		expressBiz.updateByPrimaryKeySelective(express);
		return "redirect:showexp.do?expid="+expid;
	}
	
	//仓库管理员工操作：
	@RequestMapping(value="addstaff")
	public String addstaff(User user,HttpSession session) {
		user.setId(DateUtil.getStaffId());
		user.setType("员工");
		userBiz.insertSelective(user);
		session.setAttribute("addstaffmsg", "创建成功，员工号为："+user.getId());
		return "newstaff";
	}
	
	@RequestMapping(value="showstaff")
	public String showstaff(HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		List<User> staffList = userBiz.selectbypt(user.getType());
		session.setAttribute("staffList", staffList);
		return "staff";
	}
	
	@RequestMapping(value="allorder")
	public String allorder(HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String location = user.getType().substring(0, user.getType().length()-1);
		List<Express> orderList = expressBiz.selectall(location);
		session.setAttribute("orderList", orderList);
		return "allorder";
	}

}
