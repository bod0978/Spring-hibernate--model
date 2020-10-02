package Dao;

import java.util.Date;
import java.util.List;
import java.util.Properties;


import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.hibernate.Query;
import org.hibernate.Transaction;


import Model.sendmail;
		/*
		 * 需要
		 * javamail.jar
		 * session.jar
		 * 如果import是使用Ctrl shift+O，↓這兩個import要修改成這樣，不然它會import到別的
		 * import javax.mail.Authenticator;
		 * import javax.mail.PasswordAuthentication;
		 */
public class sendMailDao {

	public static void main(String[] args) {
		/*
		sendmail sm = new sendmail();
		sm.setSub("建議");
		sm.setName("朱慶常1");
		sm.setPhone("0000222111");
		sm.setMail("bod0978@gmail.com");
		sm.setSex("男");
		sm.setNote("這是測試1冊冊冊冊冊這是測試1冊，冊冊冊冊這是測試1冊冊冊冊冊這是，試1冊冊冊冊冊這是測試1冊冊冊冊冊這是測試1，冊冊冊冊冊這是測試1冊冊冊冊冊這      是測試1冊冊冊冊冊這       是測試1冊冊冊冊冊。");
		//sm.setPdate(new Date());
		
		//new sendMailDao().add(sm);
		//new sendMailDao().getSend(sm);;
		System.out.println(sm.getPdate());
		*/
		
		List l = new sendMailDao().query();
		
		Object o[] = l.toArray();
		
		sendmail sd = (sendmail)o[4];
		System.out.println(sd.getId()+":"+sd.getNote());
	}
	
		//寄出信件
		public static void  getSend(Object o) {
	        
	        String user = "gyqqq2000";//user
	        String pwd = "0978389220";//password
	        //String to= "gyqqq2000@gmail.com";
	        String host ="smtp.gmail.com" ;
	          
	        /*
	         * host
	         * yahoo:"smtp.mail.yahoo.com"
	         * outlook:"smtp-mail.outlook.com"
	         */
	        sendmail s =(sendmail)o;
	        
	        
	        String from = s.getMail();
	        
	        //發信者信箱
	        String to = s.getMail();
	        //主旨
	        //String subject = s.getSub();
	        String subject = "您的留言類型: "+s.getSub()+" 我們已收到了~";
	        //內容
	        //String body = s.getNote();
	        String body = "感謝您的意見回饋，我們盡快回覆您，謝謝您。";
	        		
	        		
	        //String from = "gyqqq2000@gmail.com";//寄件人的email
	        //String subject = "主旨"; 
	       // String body = "內文";

	        // 建立一個Properties來設定Properties
	        Properties properties = System.getProperties();
	        //設定傳輸協定為smtp
	        properties.setProperty("mail.transport.protocol", "smtp");
	        //設定mail Server
	        properties.setProperty("smtp.gmail.com", host);
	        properties.setProperty("mail.smtp.port", "587");
	       
	        properties.put("mail.smtp.auth", "true");//需要驗證帳號密碼
	        //SSL authentication
	        properties.put("mail.smtp.ssl.enable", "false");
	        properties.put("mail.smtp.starttls.enable", "true");

	       // 建立一個Session物件，並把properties傳進去
	        Session mailSession = Session.getInstance(properties, new Authenticator(){
	            protected PasswordAuthentication getPasswordAuthentication(){
	                 return new PasswordAuthentication(user,pwd);
	            }
	        });  
	        
	        try {
	            //建立一個 MimeMessage object.
	            MimeMessage message = new MimeMessage(mailSession);
	            
	            //設定郵件
	            message.setFrom(new InternetAddress(from)); // 設定寄件人
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // 設定收件人
	            message.setSubject(subject); // 設定主旨

	            // 宣告一個multipart , 它可以使內文有不同的段落，
	            //使其可以用用來夾帶內文及檔案
	            Multipart multipart = new MimeMultipart();
	            
	            //第一個段落
	            BodyPart messageBodyPart = new MimeBodyPart(); //宣告一個BodyPart用以夾帶內文     
	            messageBodyPart.setText(body);//設定內文
	            multipart.addBodyPart(messageBodyPart); //把BodyPart加入Multipart  
	            /*  
	            //第二個段落
	            BodyPart fileBodyPart = new MimeBodyPart(); //宣告一個BodyPart用以夾帶附加檔案
	            String filename = "要送的檔案路徑";  //要夾帶的檔案名稱  
	            DataSource source = new FileDataSource(filename);//讀取檔案
	            fileBodyPart.setDataHandler(new DataHandler(source));
	            fileBodyPart.setFileName("要顯示的檔案名稱"); //設定附加檔案顯示的名稱
	            multipart.addBodyPart(fileBodyPart);//把BodyPart加入Multipart（這個part夾帶檔案）
	            */
	            
	            message.setContent(multipart); //設定eMultipart為messag的Content           
	            Transport transport = mailSession.getTransport("smtp");
	            transport.connect(host ,user, pwd);
	            //傳送信件         
	            transport.sendMessage(message,message.getAllRecipients());
	            
	            System.out.println("發送成功");
	            //關閉連線
	            transport.close();
	            
	        } catch (MessagingException mex) {
	            mex.printStackTrace();
	        }   
	    }
		
		//新增至意見SQL
		public void add(Object o ) {
			org.hibernate.Session se = implDao.getSe();
			
			Transaction tt = se.beginTransaction();
			
			se.save(o);
			tt.commit();
			se.close();	
		}
		
		public List query() {
			org.hibernate.Session se = implDao.getSe();
			Query q = se.createQuery("from sendmail");
			List l = q.list();
			return l;
		}
}
