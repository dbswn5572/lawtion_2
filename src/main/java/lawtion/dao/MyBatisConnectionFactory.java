package lawtion.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/** 
 * 1) config.xml�뙆�씪�쓣 �씫�뼱�뱾�뿬�꽌 洹� �븞�뿉 紐낆떆�맂 �젙蹂대줈 �뜲�씠�꽣踰좎씠�뒪 �젒�냽�쓣 �옄�룞 �닔�뻾.
 * 2) ~~Mapper.xml �뙆�씪�쓣 �빐�꽍�빐�꽌 �옄諛� �겢�옒�뒪瑜� �옄�룞 �깮�꽦.
 */
public class MyBatisConnectionFactory {
	/** �뜲�씠�꽣踰좎씠�뒪 �젒�냽 媛앹껜 */
	// --> import org.apache.ibatis.session.SqlSessionFactory;
	private static SqlSessionFactory sqlSessionFactory;

	/** XML�뿉 紐낆떆�맂 �젒�냽 �젙蹂대�� �씫�뼱�뱾�씤�떎. */
	static {
		try {
			// �젒�냽 �젙蹂대�� 紐낆떆�븯怨� �엳�뒗 XML�쓽 寃쎈줈 �씫湲�
			// --> import java.io.Reader
			// --> import org.apache.ibatis.io.Resources;
			Reader reader = Resources.getResourceAsReader("lawtion/dao/config.xml");

			if (sqlSessionFactory == null) {
				// --> import org.apache.ibatis.session.SqlSessionFactoryBuilder;
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		} catch (FileNotFoundException e) {
			//--> import java.io.FileNotFoundException;
			e.printStackTrace();
		} catch (IOException e) {
			//--> import java.io.IOException;
			e.printStackTrace();
		}
	}

	/** �뜲�씠�꽣踰좎씠�뒪 �젒�냽 媛앹껜瑜� 由ы꽩�븳�떎. */
	// --> import org.apache.ibatis.session.SqlSession;
	public static SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}
}
