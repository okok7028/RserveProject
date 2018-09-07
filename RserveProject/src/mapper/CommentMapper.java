package mapper;

import java.util.List;

import vo.MainCommentVO;

public interface CommentMapper {
	public int insertComment(MainCommentVO vo);
	public List<MainCommentVO> commentList(int mb_num);
	public int selectCommentLevel(int comment_num);
	public int selectMaxNum();
	public int selectCommentOriginNum(int comment_num);
}
