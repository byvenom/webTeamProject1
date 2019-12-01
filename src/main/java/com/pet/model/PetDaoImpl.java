package com.pet.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PetDaoImpl implements PetDAO {
   @Autowired
   private SqlSessionTemplate sqlSession;

   @Override
   public int idchk(String id) {
      return sqlSession.selectOne("idchk", id);
   }

   @Override
   public int nickchk(String nick) {
      return sqlSession.selectOne("nickchk", nick);
   }

   @Override
   public List<BoardDTO> dogList() {
      return this.sqlSession.selectList("doglist", "dog");
   }

   @Override
   public void adduser(memberDTO dto) {
      sqlSession.insert("adduser", dto);
   }

   @Override
   public int login(memberDTO dto) {
      return sqlSession.selectOne("login", dto);
   }

   @Override
   public memberDTO getUserInfo(String id) {
      return sqlSession.selectOne("getUserInfo", id);
   }

   @Override
   public List<BoardDTO> catgetList() {
      return this.sqlSession.selectList("catlist2");
   }

   @Override
   public List<BoardDTO> search(String field, String name) {
      if (field.equals("title")) {
         return this.sqlSession.selectList("searchTitle", name);
      } else if (field.equals("content")) {
         return this.sqlSession.selectList("searchCont", name);
      } else if (field.equals("title_cont")) {
         return this.sqlSession.selectList("searchContTitle", name);
      } else if (field.equals("writer")) {
         return this.sqlSession.selectList("searchWriter", name);
      }
      return this.sqlSession.selectList("searchWriter", "ㅁㄴㅇㄴㅁㅇ");
   }

   @Override
   public void updateUser(memberDTO dto) {
      sqlSession.update("userupadte", dto);

   }

   @Override
   public void deleteUser(String id) {
      sqlSession.delete("userdelete", id);
   }

   @Override
   public void sandamg(SangdamDTO dto) {
      sqlSession.insert("qnawrite", dto);
   }

   @Override
   public void dog_insertBoard(BoardDTO dto) {
      this.sqlSession.insert("dogadd", dto);

   }

   @Override
   public List<BoardDTO> dog_getList(int page, int rowsize) {
      // 해당 페이지의 시작 글 번호
      StartendDTO sdto = new StartendDTO();
      sdto.setStartNo(((page - 1) * rowsize) + 1);
      // 해당 페이지의 끝 글 번호
      sdto.setEndNo((page * rowsize));

      List<BoardDTO> dto = this.sqlSession.selectList("dog_list", sdto);

//      dto.get(0).setUp_file(dto.get(0).getUp_file().substring(82));
      return dto;

   }

   @Override
   public void readCount(int no) {
      this.sqlSession.update("count", no);

   }

   @Override
   public BoardDTO content(int no) {
      return this.sqlSession.selectOne("contview", no);
   }

   @Override
   public void like(int no) {
      this.sqlSession.update("like", no);

   }

   @Override
   public void unlike(int no) {
      this.sqlSession.update("unlike", no);

   }

   @Override
   public List<BoardDTO> dog_Best() {
      List<BoardDTO> dto = this.sqlSession.selectList("dmax");
      return dto;
   }

   @Override
   public int dog_Count() {
      int count = 0;
      count = this.sqlSession.selectOne("dcount");
      return count;
   }

   @Override
   public void insertCommant(CommantDTO dto) {
      this.sqlSession.insert("addCommant", dto);

   }

   @Override
   public List<CommantDTO> Commant_getList(int page, int rowsize, int ckNo) {
      // 해당 페이지의 시작 글 번호
      StartendDTO sdto = new StartendDTO();
      sdto.setStartNo(((page - 1) * rowsize) + 1);
      // 해당 페이지의 끝 글 번호
      sdto.setEndNo((page * rowsize));
      // 해당 글 번호
      sdto.setCkNo(ckNo);
      List<CommantDTO> dto = this.sqlSession.selectList("commantList", sdto);
      return dto;
   }

   /*
    * @Override public List<CommantDTO> Commant_getList(int no) { List<CommantDTO>
    * dto = this.sqlSession.selectList("commantList", no); return dto; }
    */
   @Override
   public void replyUpdate(CommantDTO dto) {
      this.sqlSession.update("replyUpdateStep", dto);

   }

   @Override
   public void replyAdd(CommantDTO dto) {
      this.sqlSession.insert("addReply", dto);

   }

   @Override
   public List<CommantDTO> test(CommantDTO dto) {
      List<CommantDTO> dto2 = this.sqlSession.selectList("commantList2", dto);

      return dto2;

   }

   @Override
   public int testMax(CommantDTO dto) {

      return this.sqlSession.selectOne("maxStep", dto);
   }

   @Override
   public int watchOn(int grp) {
      int grpCnt = this.sqlSession.selectOne("watchOn", grp);
      return grpCnt;
   }

   @Override
   public void updateBoard(BoardDTO dto) {
      this.sqlSession.update("updateBoard", dto);

   }

   @Override
   public void photoUpdate(BoardDTO dto) {
      this.sqlSession.update("photoUpdate", dto);

   }

   @Override
   public void deleteBoard(BoardDTO dto) {
      this.sqlSession.delete("deleteBoard", dto);

   }

   @Override
   public void deleteCommantAll(BoardDTO dto) {
      this.sqlSession.delete("deleteCommantAll", dto);

   }

   @Override
   public void deleteCommantOne(int no) {
      this.sqlSession.update("deleteCommantOne", no);

   }

   @Override
   public void updateCommant(CommantDTO dto) {
      this.sqlSession.update("updateCommant", dto);

   }

   @Override
   public void upchk(UpDTO dto) {
      this.sqlSession.insert("upchk", dto);

   }

   @Override
   public int chk(UpDTO dto) {
      int ck = this.sqlSession.selectOne("chkon", dto);
      return ck;
   }

   @Override
   public void downchk(UpDTO dto) {
      this.sqlSession.delete("downchk", dto);

   }

   @Override
   public void deleteBoardUp(int no) {
      this.sqlSession.delete("deleteBoardUp", no);

   }

   @Override
   public void commant_like(int no) {
      this.sqlSession.update("commant_like", no);

   }

   @Override
   public void commant_unlike(int no) {
      this.sqlSession.update("commant_unlike", no);

   }

   @Override
   public int commant_count(int no) {
      int count = 0;
      count = this.sqlSession.selectOne("commant_count", no);
      return count;
   }

   @Override
   public List<CommantDTO> Commant_getList123(int startNo, int endNo, int ckNo) {
      StartendDTO sdto = new StartendDTO();
      sdto.setStartNo(startNo);
      sdto.setEndNo(endNo);
      sdto.setCkNo(ckNo);
      List<CommantDTO> dto = this.sqlSession.selectList("commantList123", sdto);
      return dto;
   }

   @Override
   public int dogSearchCount(String find_field, String find_name) {
      find_name=find_name.replaceAll(" ", "");
      return this.sqlSession.selectOne("dog"+find_field+"Count", "%"+find_name+"%");
   }

   @Override
   public List<BoardDTO> dogSearchList(int page, int rowsize, String find_name, String find_field) {
      int startNo = ((page - 1) * rowsize) + 1;
      int endNo = (page * rowsize);
      StartendDTO sdto = new StartendDTO();
      sdto.setStartNo(startNo);
      sdto.setEndNo(endNo);
      sdto.setFind_field("dog"+find_field);
      sdto.setFind_name("%"+find_name.replaceAll(" ", "")+"%");
      return this.sqlSession.selectList(sdto.getFind_field(),sdto);
   }
   
   @Override
	public List<SangdamDTO> sangdam() {
		return this.sqlSession.selectList("sangdam","sangdam");
	}

	@Override
	public void deleteSangdam(String tomail) {
		this.sqlSession.delete("deleteSangdam", tomail);
		
	}
	@Override
	public List<BoardDTO> konggeelist(){
	   return this.sqlSession.selectList("konggeelist","konggee");
	}
	@Override
	public void insertKonggee(BoardDTO dto) {
		this.sqlSession.selectList("insertKonggee", dto);
		
	}
   
   @Override
   public List<PlaceDTO> getPlaceList(String place){
	   return this.sqlSession.selectList("placeSearch", place);
   }
   @Override
   public void addPlace(PlaceDTO dto) {
	   this.sqlSession.insert("addPlace", dto);
   }
   @Override
   public PlaceDTO getPlaceInfo(int no) {
	   return this.sqlSession.selectOne("placeinfo", no);
   }
   
   @Override
   public List<ProductDTO> getSelectItemList(int no){
	   return this.sqlSession.selectList("selectitempage",no);
   }

@Override
public List<BoardDTO> catList() {
	return this.sqlSession.selectList("catlist", "cat");
}

@Override
public List<BoardDTO> cat_getList(int page, int rowsize) {
	 // 해당 페이지의 시작 글 번호
    StartendDTO sdto = new StartendDTO();
    sdto.setStartNo(((page - 1) * rowsize) + 1);
    // 해당 페이지의 끝 글 번호
    sdto.setEndNo((page * rowsize));

    List<BoardDTO> dto = this.sqlSession.selectList("cat_list", sdto);

//    dto.get(0).setUp_file(dto.get(0).getUp_file().substring(82));
    return dto;
}

@Override
public List<BoardDTO> cat_Best() {
	List<BoardDTO> dto = this.sqlSession.selectList("cmax");
    return dto;
}

@Override
public int cat_Count() {
	 int count = 0;
     count = this.sqlSession.selectOne("ccount");
     return count;
}

@Override
public int catSearchCount(String find_field, String find_name) {
	find_name=find_name.replaceAll(" ", "");
    return this.sqlSession.selectOne("cat"+find_field+"Count", "%"+find_name+"%");
}

@Override
public List<BoardDTO> catSearchList(int page, int rowsize, String find_name, String find_field) {
	  int startNo = ((page - 1) * rowsize) + 1;
      int endNo = (page * rowsize);
      StartendDTO sdto = new StartendDTO();
      sdto.setStartNo(startNo);
      sdto.setEndNo(endNo);
      sdto.setFind_field("cat"+find_field);
      sdto.setFind_name("%"+find_name.replaceAll(" ", "")+"%");
      return this.sqlSession.selectList(sdto.getFind_field(),sdto);
}

@Override
public void cat_insertBoard(BoardDTO dto) {
	this.sqlSession.insert("catadd", dto);
	
}

@Override
public void free_insertBoard(BoardDTO dto) {
	this.sqlSession.insert("freeadd", dto);
	
}

@Override
public List<BoardDTO> free_getList(int page, int rowsize) {
	 StartendDTO sdto = new StartendDTO();
	    sdto.setStartNo(((page - 1) * rowsize) + 1);
	    // 해당 페이지의 끝 글 번호
	    sdto.setEndNo((page * rowsize));

	    List<BoardDTO> dto = this.sqlSession.selectList("free_list", sdto);

//	    dto.get(0).setUp_file(dto.get(0).getUp_file().substring(82));
	    return dto;
}

@Override
public int free_Count() {
	 int count = 0;
     count = this.sqlSession.selectOne("fcount");
     return count;
}
@Override
public int dogInfo_Count() {
	 int count = 0;
     count = this.sqlSession.selectOne("dogInfo_Count");
     return count;
}
@Override
public int catInfo_Count() {
	int count = 0;
	count = this.sqlSession.selectOne("catInfo_Count");
	return count;
}

@Override
public int freeSearchCount(String find_field, String find_name) {
	find_name=find_name.replaceAll(" ", "");
    return this.sqlSession.selectOne("free"+find_field+"Count", "%"+find_name+"%");
}

@Override
public List<BoardDTO> freeSearchList(int page, int rowsize, String find_name, String find_field) {
	int startNo = ((page - 1) * rowsize) + 1;
    int endNo = (page * rowsize);
    StartendDTO sdto = new StartendDTO();
    sdto.setStartNo(startNo);
    sdto.setEndNo(endNo);
    sdto.setFind_field("free"+find_field);
    sdto.setFind_name("%"+find_name.replaceAll(" ", "")+"%");
    return this.sqlSession.selectList(sdto.getFind_field(),sdto);
}

@Override
public List<BoardDTO> free_Best() {
	List<BoardDTO> dto = this.sqlSession.selectList("fmax");
    return dto;
}

@Override
public void boardWriterUpdate(String backNickName, String changeNickName) {
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("backNickName",backNickName);
	map.put("changeNickName",changeNickName);
	this.sqlSession.update("bwu", map);
	
}

@Override
public void commantWriterUpdate(String backNickName, String changeNickName) {
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("backNickName",backNickName);
	map.put("changeNickName",changeNickName);
	this.sqlSession.update("cwu", map);
}
@Override
public void addItem(ProductDTO dto) {
   this.sqlSession.selectOne("additem", dto);
}
@Override
public List<ProductDTO> getItemList(){
   return this.sqlSession.selectList("allitem");
}
@Override
public List<ProductDTO> getSelectItemRange(int no){
   return this.sqlSession.selectList("selectitemrange",no);
}
@Override
public List<ProductDTO> getPublicCateItem(int no){
   return this.sqlSession.selectList("publiccateitem", no);
}
@Override
public List<ProductDTO> getCateItem(int no){
   return this.sqlSession.selectList("cateitem", no);
}
@Override
public List<BoardDTO> dogInfo_getList(){
	 

	    List<BoardDTO> dto = this.sqlSession.selectList("dogInfo_getList");
	return dto;
}
@Override
public List<BoardDTO> catInfo_getList(){
	
	
	List<BoardDTO> dto = this.sqlSession.selectList("catInfo_getList");
	return dto;
}
@Override
public ProductDTO getItemcont(int no) {
   return this.sqlSession.selectOne("itemcont", no);
}
@Override
public int isBasket(BasketDTO dto) {
   return this.sqlSession.selectOne("isBasket",dto);
}
@Override
public void addBasket(BasketDTO dto) {
   this.sqlSession.insert("addbasket", dto);
}
@Override
public void addUpdateBasket(BasketDTO dto) {
   this.sqlSession.update("addupdatebasket", dto);
}
@Override
public int isZzim(ZzimDTO dto) {
   return this.sqlSession.selectOne("isZzim", dto);
}
@Override
public void addZzim(ZzimDTO dto) {
   this.sqlSession.insert("addzzim", dto);
}
@Override
public List<Integer> getMyZzim(String id){
   return this.sqlSession.selectList("getmyzzim", id);
}
@Override
public void deleteZzimItem(ZzimDTO dto) {
   this.sqlSession.delete("deleteZzim", dto);
}
@Override
public List<BasketDTO> getMyBasket(String id){
   return this.sqlSession.selectList("getmybasket", id);
}
@Override
public void deleteBasketItem(BasketDTO dto) {
   this.sqlSession.delete("deletebaskteritem",dto);
}
@Override
public void changeBasketNum(BasketDTO dto) {
   this.sqlSession.update("chnagebasketNum", dto);
}

@Override
public void parceloutwrite(BoardDTO dto) {
	this.sqlSession.insert("parceloutwrite", dto);
	
}
@Override
public List<BoardDTO> getParList(){
	return this.sqlSession.selectList("getParList");
}

@Override
public List<BoardDTO> getCatParList() {
	return this.sqlSession.selectList("getCatParList");
}

@Override
public List<BoardDTO> getDogParList() {
	// TODO Auto-generated method stub
	return this.sqlSession.selectList("getDogParList");
}

@Override
public List<BoardDTO> searchBoard(String find_name) {
	String asd="%"+find_name+"%";
	return this.sqlSession.selectList("searchBoard", asd);
}
@Override
public List<ProductDTO> searchProduct(String find_name) {
	String asd="%"+find_name+"%";
	return this.sqlSession.selectList("searchProduct", asd);
}
@Override
public List<PlaceDTO> searchPlace(String find_name) {
	String asd="%"+find_name+"%";
	return this.sqlSession.selectList("searchPlace", asd);
}

@Override
public void info_insertBoard(BoardDTO dto) {
	this.sqlSession.insert("infoadd", dto);
	
}

}