package ccst.sh.admin.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ccst.sh.admin.domain.request.AdminNotice;
import ccst.sh.admin.domain.response.LoginResponse;
import ccst.sh.admin.domain.response.NoticesResponse;
import ccst.sh.admin.service.AdminService;
import ccst.sh.common.constans.SessionConstans;

@Controller
public class Admincontroller {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/admin/login", method = RequestMethod.POST)
    @ResponseBody
    public Boolean login(HttpSession session, @RequestParam("username") String username, @RequestParam("password") String password) {
        LoginResponse admin = adminService.login(username, password);
        if (0 != admin.getAdminId()) {
            session.setAttribute(SessionConstans.ADMIN_ADMIN_ID, admin.getAdminId());
            return true;
        }
        return false;
    }
    
    @RequestMapping(value = "/admin/notices", method = RequestMethod.GET)
    public String getNotices(HttpSession session, Map<String, Object> map) {
        Integer adminId = (Integer) session.getAttribute(SessionConstans.ADMIN_ADMIN_ID);
        List<NoticesResponse> notices = adminService.getNotices(adminId);
        map.put("noticesList", notices);
        return "admin/noticeslist";
    }

    @RequestMapping(value = "/admin/add", method = RequestMethod.GET)
    public String getAllClassName() {
        return "admin/addnotice";
    }
    
    @RequestMapping(value = "/admin/notice", method = RequestMethod.POST)
    public String addNotice(HttpSession session, AdminNotice notice) {
        Integer adminId = (Integer) session.getAttribute(SessionConstans.ADMIN_ADMIN_ID);
        adminService.addNotice(adminId, notice);
        return "admin/noticeslist";
    }
    
    @RequestMapping(value = "/admin/loginout", method = RequestMethod.GET)
    public String loginOut(HttpSession session) {
        session.removeAttribute(SessionConstans.ADMIN_ADMIN_ID);
        return "redirect:/";
    }
     
    @RequestMapping(value = "/admin/notice/delete/{noticeId}", method = RequestMethod.GET)
    @ResponseBody
    public Boolean deleteNotice(@PathVariable("noticeId") Integer noticeId) {
        return  adminService.deleteNotice(noticeId);
    }
}
