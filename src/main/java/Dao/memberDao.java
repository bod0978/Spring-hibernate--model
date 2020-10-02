package Dao;

import java.text.SimpleDateFormat;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.member;

public class memberDao implements implDao{

	public static void main(String[] args) {
		/*member m = new member();
		m.setName("test06");
		m.setPassword("1111");
		m.setPhone("22233323");
		m.setSex("女");
		m.setUser("test06");
		m.setMail("test02@gmail.com");
		m.setAddress("台北市中正區");
		
		java.sql.Date d = new java.sql.Date((1988-1900),(12-1), 31);
		m.setBady(d);
		
		new memberDao().add(m);
		*/
		
		/*
		List l = new memberDao().query();
		
		for(int i=0;i<l.size();i++) {
			Object o[] = l.toArray();
			member m = (member)o[i];
			System.out.println(m.getName()+"\n");
		}
		*/
		/*member m = new member();
		m.setId(6);
		new memberDao().delete(m);
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
		
		Transaction tt = se.beginTransaction();
		member m = (member)o;
		se.update(m);
		tt.commit();
		se.close();
		
	}

	@Override
	public void delete(Object o) {
		Session se = implDao.getSe();
		
		Transaction tt = se.beginTransaction();
		
		se.delete(o);
		tt.commit();
		se.close();
		
	}
	
	//查詢全部
	@Override
	public List query() {
		Session se = implDao.getSe();
		Query q = se.createQuery("from  member");
		List l = q.list();
		return l;
	}
	
	//查詢帳密
	public List loginUser(String user,String password) {
		Session se = implDao.getSe();
		Query q = se.createQuery("from  member where user='"+user+"' and password='"+password+"' ");
		List l = q.list();
		return l;
	}
	
	//查詢帳號
	public List checkUser(String user) {
		Session se = implDao.getSe();
		Query q = se.createQuery("from  member where user='"+user+"' ");
		List l = q.list();
		return l;
	}


}
