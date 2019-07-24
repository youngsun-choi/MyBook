package service;

import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import model.Book;
import model.InterestBookList;
import model.Log;
import model.MyBookList;

@Service
public class NaverBookService {
	@Autowired
	SqlSession session=null;
	
	private static String clientID = "cTj9CJ7ev5hnHb4dsgdX";
	private static String clientSecret="DgiKpqs83X";
	
	public List<Book> searchBook(String keyword, int display, int start) {
		List<Book> list = null;
		try {
			URL url;
			url = new URL("https://openapi.naver.com/v1/search/book.xml?query=" + URLEncoder.encode(keyword, "UTF-8")
			+ (display !=0 ? "&display=" + display :"")
			+ (start !=0 ? "&start=" + start :""));
			
			URLConnection urlConn = url.openConnection();
			urlConn.setRequestProperty("X-naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-naver-Client-Secret", clientSecret);
			
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();
			parser.setInput(new InputStreamReader(urlConn.getInputStream(), "UTF-8"));
		
			int eventType = parser.getEventType();
			Book b = null;
			while(eventType != XmlPullParser.END_DOCUMENT) {
				switch(eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<Book>(); 
					break;
				case XmlPullParser.END_TAG: {
					String tag = parser.getName();
					if(tag.equals("item")) {
						list.add(b);
						b = null;
					}
				}
				case XmlPullParser.START_TAG: {
					String tag = parser.getName();
					switch (tag) {
                    case "item": 
                        b = new Book();
                        break;
                    case "title":
                        if(b != null)
                            b.setTitle(parser.nextText());
                        break;
                    case "link":
                        if(b != null)
                            b.setLink(parser.nextText());
                        break;
                    case "image":
                        if(b != null)
                            b.setImage(parser.nextText().replace("type=m1", ""));
                        break;
                    case "author":
                        if(b != null)
                            b.setAuthor(parser.nextText());
                        break;
                    case "price":
                        if(b != null)
                            b.setPrice(parser.nextText());
                        break;
                    case "discount":
                        if(b != null)
                            b.setDiscount(parser.nextText());
                        break;
                    case "publisher":
                        if(b != null)
                            b.setPublisher(parser.nextText());
                        break;
                    case "pubdate":
                        if(b != null)
                            b.setPubdate(parser.nextText());
                        break;
                    case "isbn":
                        if(b != null)
                            b.setIsbn(parser.nextText());
                        break;
                    case "description":
                        if(b != null)
                            b.setDescription(parser.nextText());
                        break;
                    }
				}
				}
				eventType = parser.next();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

	//myBookList
	public List<MyBookList> listAll(MyBookList model){
		List<MyBookList> list = null;
		String statement = "resource.MyBookListMapper.selectAllBookList";
		list = session.selectList(statement, model);
		return list;
	}
	
	public boolean insert(MyBookList vo) {
		boolean result=true;
		String statement = "resource.MyBookListMapper.insertBookList";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	public boolean delete(int id) {
		boolean result=true;
		String statement = "resource.MyBookListMapper.deleteBookList";
		if(session.delete(statement, id) != 1)
			result = false;
		return result;
	}
	
	public boolean deleteAll(String email) {
		String statement = "resource.MyBookListMapper.deleteAll";
		if(session.delete(statement, email) != 1)
			return false;
		return true;
	}
	
	public boolean update(MyBookList vo) {
		boolean result=true;
		String statement = "resource.MyBookListMapper.updateBookList";
		if(session.update(statement, vo) != 1)
			result = false;
		return result;
	}

	public List<MyBookList> searchReadbook(Map<String, String>map) {
		List<MyBookList> list = null;
		String statement = "resource.MyBookListMapper.searchBookList";
		list = session.selectList(statement, map);
		return list;
	}
	
	public List<MyBookList> trendingbook() {
		List<MyBookList> list = null;
		String statement = "resource.MyBookListMapper.trendingbook";
		list = session.selectList(statement);
		return list;
	}
	
	//select last registdate
	public String selectMyBookLastRegistDate(){
		String statement = "resource.MyBookListMapper.selectMyBookLastRegistDate";
		String result = session.selectOne(statement);
		return result;
	}
	
	public String selectInterestLastRegistDate(){
		String statement = "resource.MyBookListMapper.selectInterestLastRegistDate";
		String result = session.selectOne(statement);
		return result;
	}
	
	//log
	public List<Log> selectLog(){ //메인페이지 활동로그
		List<Log> list = null;
		String statement = "resource.MyBookListMapper.selectLog";
		list = session.selectList(statement);
		return list;
	}
	
	public boolean insertLog(Log vo) {
		boolean result=true;
		String statement = "resource.MyBookListMapper.insertLog";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	public boolean updateLog(Log vo) {
		boolean result=true;
		String statement = "resource.MyBookListMapper.updateLog";
		if(session.update(statement, vo) != 1)
			result = false;
		return result;
	}
	
	public boolean updateUserName(Log vo) {
		boolean result=true;
		String statement = "resource.MyBookListMapper.updateUserName";
		if(session.delete(statement,vo) != 1)
			result = false;
		return result;
	}
	
	public boolean deleteLog(int id) {
		boolean result=true;
		String statement = "resource.MyBookListMapper.deleteLog";
		if(session.delete(statement, id) != 1)
			result = false;
		return result;
	}
	
	//InterestBookList
		public List<InterestBookList> listAllInterestBook(String id){
			List<InterestBookList> list = null;
			String statement = "resource.MyBookListMapper.selectAllInterestBookList";
			list = session.selectList(statement, id);
			return list;
		}
		
		public boolean insertInterestBook(InterestBookList vo) {
			boolean result=true;
			String statement = "resource.MyBookListMapper.insertInterestBookList";
			if(session.insert(statement, vo) != 1)
				result = false;
			return result;
		}
		
		public boolean deleteInterestBook(int id) {
			boolean result=true;
			String statement = "resource.MyBookListMapper.deleteInterestBookList";
			if(session.delete(statement, id) != 1)
				result = false;
			return result;
		}
		
		public boolean deleteAllInterestBook(String email) {
			String statement = "resource.MyBookListMapper.deleteAllInterestBook";
			if(session.delete(statement, email) != 1)
				return false;
			return true;
		}
		
		public List<InterestBookList> searchInterestbook(Map<String, String>map) {
			List<InterestBookList> list = null;
			String statement = "resource.MyBookListMapper.searchInterestbook";
			list = session.selectList(statement, map);
			return list;
		}
		
		public int countInterestBook(String userId) {
			String statement = "resource.MyBookListMapper.countInterestBookList";
			int total = session.selectOne(statement, userId);
			return total;
		}
		
	//detailInterestBook
		public List<InterestBookList> selectDetailInterestBook(int id){
			List<InterestBookList> list = null;
			String statement = "resource.MyBookListMapper.selectDetailInterestBook";
			list = session.selectList(statement, id);
			return list;
		}

	//페이징
	public int getTotalCnt(String userId) {
		String statement = "resource.MyBookListMapper.totalCnt";
		return session.selectOne(statement, userId);
	}
	
	public List<Log> selectTotalLog(Log model){ //전체 활동로그
		List<Log> list = null;
		String statement = "resource.MyBookListMapper.selectTotalLog";
		list = session.selectList(statement, model);
		return list;
	}
	
	public int getTotalCntLog() {
		String statement = "resource.MyBookListMapper.totalCntLog";
		return session.selectOne(statement);
	}
}

