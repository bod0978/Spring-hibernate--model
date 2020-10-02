package Fact1;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import Dao.FactDao;
import Dao.memberDao;
import Dao.sendMailDao;
import Dao.staffDao;

@Configuration
public class beanFactDao {
	
	@Bean(name="MD")
	public memberDao getMemberDao() {
		return new memberDao();
	}
	
	@Bean(name="SMD")
	public sendMailDao getSendMailDao() {
		return new sendMailDao();
	}
	
	@Bean(name="SD")
	public staffDao getStaffDao() {
		return new staffDao();
	}
	
	@Bean(name="FD")
	public FactDao getFactDao() {
		FactDao FD = new FactDao();
		FD.setMD(getMemberDao());
		FD.setSMD(getSendMailDao());
		FD.setSD(getStaffDao());
		return FD;
	}
}
