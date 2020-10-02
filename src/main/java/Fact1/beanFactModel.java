package Fact1;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import Model.FactModel;
import Model.bookk;
import Model.member;
import Model.sendmail;
import Model.staff;

@Configuration
public class beanFactModel {
	
	@Bean(name="member")
	public member getMember() {
		return new member();
	}
	
	@Bean(name="sendmail")
	public sendmail getSendmail() {
		return new sendmail();
	}
	
	@Bean(name="staff")
	public staff getStaff() {
		return new staff();
	}
	
	@Bean(name="bookk")
	public bookk getBookk() {
		return new bookk();
	}
	
	@Bean(name="fm")
	public FactModel getFactModel() {
		FactModel fm1 = new FactModel();
		fm1.setMember(getMember());
		fm1.setSendmail(getSendmail());
		fm1.setStaff(getStaff());
		fm1.setBookk(getBookk());
		return fm1;
	}
}
