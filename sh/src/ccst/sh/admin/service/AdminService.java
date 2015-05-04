package ccst.sh.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ccst.sh.admin.dao.AdminDao;
import ccst.sh.admin.domain.request.AdminNotice;
import ccst.sh.admin.domain.response.LoginResponse;
import ccst.sh.admin.domain.response.NoticesResponse;

@Service
@Transactional(readOnly = true, rollbackFor = { Exception.class })
public class AdminService {

    @Autowired
    private AdminDao adminDao;

    public LoginResponse login(String username, String password) {
        return adminDao.login(username, password);
    }

    public List<NoticesResponse> getNotices(Integer adminId) {
        return adminDao.getNotices(adminId);
    }
    
    @Transactional
    public Boolean addNotice(Integer adminId, AdminNotice notice) {
        return adminDao.addNotice(adminId, notice);
    }
    
    @Transactional
    public Boolean deleteNotice(Integer noticeId) {
        return adminDao.deleteNotice(noticeId);
    }
}
