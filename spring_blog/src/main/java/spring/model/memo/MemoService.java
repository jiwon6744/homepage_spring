package spring.model.memo;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
@Service 
public class MemoService {
       @Autowired
        private MemoDAO dao;
       @Autowired
        private mReplyDAO rdao;
       
      public void delete(int bbsno) throws Exception{
             rdao.bdelete(bbsno); // 댓글들 삭제(자식레코드)
             dao.delete(bbsno); // 댓글을 가진 부모글 삭제(부모레코드)
      }
}