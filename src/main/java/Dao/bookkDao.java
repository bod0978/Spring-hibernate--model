package Dao;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.bookk;

public class bookkDao implements implDao{

	public static void main(String[] args) {
		bookk b =new bookk();
		b.setName("test01");
		b.setPeople(4);
		b.setPhone("98838383");
		
		String dateString = "2020-08-24 12:30:00";
		//設定日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//進行轉換
		
		try {
			java.util.Date date = sdf.parse(dateString);
			
			b.setOrdertime(date);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		new bookkDao().add(b);

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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Object o) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List query() {
		// TODO Auto-generated method stub
		return null;
	}

}
