package naree.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import naree.db.domain.Notice;
import naree.db.mapper.NoticeMapper;
import naree.util.factory.ConnectionFactory;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	/**
	 * 공지사항 저장
	 * @param notice
	 */
	@Override
	public void registerNotice(Notice notice) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		try {
			NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
			noticeMapper.registerNotice(notice);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	/**
	 * 공지사항 목록 읽어오기
	 * @param pageCnt
	 * @return
	 */
	@Override
	public List<Notice> listNotices(int pageCnt) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<Notice> result = new ArrayList<Notice>();
		try {
			NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
			result = noticeMapper.listNotices(pageCnt*10);
		} finally {
			sqlSession.close();
		}
		return result;
	}

	/**
	 * 공지사항 읽어오기
	 * @param notice_seq
	 * @return
	 */
	@Override
	public Notice selectByNoticeSeq(int notice_seq) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		Notice result = null;
		try {
			NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
			result = noticeMapper.selectByNoticeSeq(notice_seq);
		} finally {
			sqlSession.close();
		}
		return result;
	}

	/**
	 * 공지사항 수정하기
	 * @param notice
	 * @return
	 */
	@Override
	public int updateByNotice(Notice notice) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result = 0;
		try {
			NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
			result = noticeMapper.updateByNotice(notice);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	/**
	 * 공지사항 삭제하기
	 * @param notice_seq
	 * @return
	 */
	@Override
	public int deleteByNoticeSeq(int notice_seq) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result = 0;
		try {
			NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
			result = noticeMapper.deleteByNoticeSeq(notice_seq);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

}
