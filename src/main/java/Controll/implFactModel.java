package Controll;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import Fact1.beanFactDao;
import Fact1.beanFactModel;

public interface implFactModel {
	
	//model 工廠模式連線
	ApplicationContext acm = new AnnotationConfigApplicationContext(beanFactModel.class);
	
	//Dao 工廠模式連線
	ApplicationContext acd = new AnnotationConfigApplicationContext(beanFactDao.class);
}
