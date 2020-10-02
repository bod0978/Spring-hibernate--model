package Dao;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.staff;

public class staffDao implements implDao{

	public static void main(String[] args) {
		/*staff sf = new staff();
		//sf.setId(4);
		sf.setName("程式設計師");
		sf.setUser("allen");
		sf.setPassword("12312123");
		sf.setPhone("0911111111");
		sf.setMail("root@root232.com.tw");
		sf.setType(true);
		sf.setAddress("新北市中和區");
		
		java.sql.Date body = new java.sql.Date((1984-1900),(1-1), 5);
		sf.setBody(body);
		sf.setWorking(new Date());
		
		//new staffDao().update(sf);
		
		//new staffDao().delete(sf);
		//new staffDao().add(sf);
		//System.out.println(sf.getBody());	
		//List l= new staffDao().stalogin("roo2t","123123");
		//List l = new staffDao().checkstaff("root2");
		//System.out.println(l.size());
		*/
		
	
	}

	@Override
	public void add(Object o) {
		Session se = implDao.getSe();
		Transaction tt = se.beginTransaction();
		se.save(o);
		tt.commit();
		se.close();
		
	}

	@Override
	public void update(Object o) {
		Session se = implDao.getSe();
		staff sf = (staff)o;
		Transaction tt = se.beginTransaction();
		
		Object o1 = new staffDao().query(sf.getId());
		staff s1 = (staff)o1;
		
		if(sf.getUser()==null || sf.getUser()=="") sf.setUser(s1.getUser());
		if(sf.getPassword()==null || sf.getPassword()=="") sf.setPassword(s1.getPassword());
		if(sf.getName()==null || sf.getName()=="") sf.setName(s1.getName());
		if(sf.getPhone() ==null || sf.getPhone()=="") sf.setPhone(s1.getPhone());
		if(sf.getMail()==null || sf.getMail()=="") sf.setMail(s1.getMail());
		if(sf.getType()==null ) sf.setType(s1.getType());
		
		
		//System.out.println(sf.getId()+" "+sf.getName()+" "+sf.getBody()+" "+sf.getType()+" "+sf.getWorking());
		se.update(sf);
		tt.commit();
		se.close();
		
	}

	@Override
	public void delete(Object o) {
		Session se = implDao.getSe();
		Transaction tt = se.beginTransaction();
		
		System.out.println(o);
		
		se.delete(o);
		tt.commit();
		se.close();
		
	}
	
	
	//查看員工所有資料
	@Override
	public List query() {
		Session se = implDao.getSe();
		Query q = se.createQuery("from staff ");
		List l = q.list();
		return l;
	}
	
	
	public Object query(Integer id) {
		Session se = implDao.getSe();
		Object o = se.get(staff.class, id);
		return o;
	}
	
	//確認員工帳號
	public List checkstaff(String user) {
		Session se = implDao.getSe();
		Query q = se.createQuery("from staff where user ='"+user+"'");
		List l = q.list();
		return l;
	}
	
	
	//確認員工帳號密碼
	public List stalogin(String user,String password) {
		Session se = implDao.getSe();
		Query q = se.createQuery("from staff where user ='"+user+"' and password='"+password+"'");
		List l = q.list();
		return l;
	}

}
