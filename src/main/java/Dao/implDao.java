package Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public interface implDao {
	//連線
	public static Session getSe() {
		
		Configuration conn = new Configuration().configure();
		
		SessionFactory sf = conn.buildSessionFactory();
		
		Session se = sf.openSession();
		
		return se;
	}
	//add
	void add(Object o);
	//update
	void update(Object o);
	//delete
	void delete(Object o);
	//query
	List query();
}
