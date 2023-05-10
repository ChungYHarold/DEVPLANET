package kr.co.sist.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.admin.vo.AdminCorpVO;
import kr.co.sist.admin.vo.SelectCorpVO;
import kr.co.sist.dao.DbConnection;

public class AdminCorpDAO {

	// 등록된 기업
	public int selectCountAllCorp() throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dbCon.getConn();

			StringBuilder countCorp = new StringBuilder();
			countCorp
			.append("    select count(corp_num)  ")
			.append("    from corp    ");

			pstmt = con.prepareStatement(countCorp.toString());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			} // end if
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return cnt;
	}// selectCountAllCorp

	// 등록기업 현황
	public List<SelectCorpVO> selectAllCorp(String cName) throws SQLException {
		List<SelectCorpVO> list = new ArrayList<SelectCorpVO>();

		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 만약 기업 검색을 안한다면
			con = dbCon.getConn();

			StringBuilder selectCorp = new StringBuilder();
			/*
			 * 대표자 출력 selectCorp
			 * .append("SELECT corp.corp_num, corp.name, corp.type, corp.field, corp.emp, corp.establish_year, corp.addr, representative.name AS rep_name "
			 * )
			 * .append("FROM CORP JOIN representative ON corp.corp_num = representative.corp_num "
			 * );
			 */

			// 대표자 출력 x
			selectCorp.append("    select corp_num, name, type, field, emp, establish_year, addr    ")
					.append("    from corp    ");
			// 기업 검색에 입력한 경우 where절 추가
			if (cName != null) {
				selectCorp.append("WHERE corp.name = ?");
				pstmt = con.prepareStatement(selectCorp.toString());
				pstmt.setString(1, cName);
			} else {
				pstmt = con.prepareStatement(selectCorp.toString());
			} // end else

			rs = pstmt.executeQuery();

			SelectCorpVO scVO = null;
			while (rs.next()) {
				scVO = new SelectCorpVO();
				scVO.setNum(rs.getInt("corp_num"));
				scVO.setName(rs.getString("name"));
				scVO.setType(rs.getString("type"));
				scVO.setField(rs.getString("field"));
				scVO.setEmp(rs.getInt("emp"));
				scVO.setEstablishYear(rs.getDate("establish_year"));
				scVO.setAddr(rs.getString("addr"));

				/*
				 * // 대표자 이름을 가져와서 배열에 추가 String[] representativeNames =
				 * {rs.getString("rep_name")}; scVO.setRepresentativeName(representativeNames);
				 */

				list.add(scVO);
			} // end while
		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally
		return list;
	}// selectAllCorp

	// 기업 등록
	public void insertCorp(AdminCorpVO acVO) throws SQLException {

		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dbCon.getConn();
			StringBuilder insertCorp = new StringBuilder();
			insertCorp.append(
					"insert into corp(corp_num, business_num, name, homepage, type, field, establish_year, emp, logo, zipcode, addr, detail_addr, input_date)  ")
					.append("  values(seq_corp.nextval,?,?,?,?,?,?,?,?,?,?,?,sysdate)   ");

			pstmt = con.prepareStatement(insertCorp.toString());

			pstmt.setString(1, acVO.getBusinessNum());
			pstmt.setString(2, acVO.getName());
			pstmt.setString(3, acVO.getHomepage());
			pstmt.setString(4, acVO.getType());
			pstmt.setString(5, acVO.getField());
			pstmt.setDate(6, acVO.getEstablishYear());
			pstmt.setInt(7, acVO.getEmp());
			pstmt.setString(8, acVO.getLogo());
			pstmt.setInt(9, acVO.getZipcode());
			pstmt.setString(10, acVO.getAddr());
			pstmt.setString(11, acVO.getDetailAddr());

			pstmt.executeQuery();
		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally
	}// insertCorp

	/*
	 * public void insertRepresent(String name)throws SQLException {
	 * 
	 * DbConnection dbCon=DbConnection.getInstance(); Connection con=null;
	 * PreparedStatement pstmt=null;
	 * 
	 * try {
	 * 
	 * con=dbCon.getConn(); String
	 * insertRepresent="insert into representative(num, name, corp_num) values(SEQ_REPRESENT.nextval, ? , seq_corp.currval)"
	 * ;
	 * 
	 * pstmt =con.prepareStatement(insertRepresent);
	 * 
	 * 
	 * String[] representativeName = acVO.getRepresentativeName(); // acVO에 대표자이름이
	 * 배열로 저장되어 있어서 배열의 representativeName으로 받고 String names=""; int
	 * len=representativeName.length; //representativeName의 길이만큼 for문 돌릴꺼라 int데이터
	 * 형으로 받고 for (int i=0;i<len;i++) { names+=representativeName[i]; //for문 돌려서 0번방
	 * 부터 끝까지 모든 이름을 names라는 String데이터형에 저장하고 if (i<len - 1) { names+=","; //
	 * CSV데이터로 사용하기 위해 이름은 ,로 구분하게 하고 }//end if }//end for
	 * 
	 * 
	 * pstmt.setString(1, name); //,로 구분된 문자열을 대표자명에 insert 만약 김경태 윤상준 두명의 대표자면 DB에는
	 * "김경태,윤상준" 이렇게 CSV데이터인 문자열로 한번에 들어감 // 나중에 select으로 화면에 뿌릴 때 CSV데이터를 spilt으로
	 * 쪼개서 배열로 다시 저장하고 뿌려줘야 할듯?
	 * 
	 * pstmt.executeQuery();
	 * 
	 * }finally { dbCon.dbClose(null, pstmt, con); }//end finally }//end
	 * insertRepresent
	 */
	
	public void insertRepresent(AdminCorpVO acVO)throws SQLException {
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			
			con=dbCon.getConn();
			String insertRepresent="insert into representative(num, name, corp_num) values(SEQ_REPRESENT.nextval, ? , seq_corp.currval)";
			
			pstmt =con.prepareStatement(insertRepresent);
			
			String[] representativeName = acVO.getRepresentativeName(); // acVO에 대표자이름이 배열로 저장되어 있어서 배열의 representativeName으로 받고
			String names="";
			int len=representativeName.length; //representativeName의 길이만큼 for문 돌릴꺼라 int데이터 형으로 받고
			for (int i=0;i<len;i++) { 
			    names+=representativeName[i];  //for문 돌려서 0번방 부터 끝까지 모든 이름을 names라는 String데이터형에 저장하고
			    if (i<len - 1) {
			        names+=",";  // CSV데이터로 사용하기 위해 이름은 ,로 구분하게 하고
			    }//end if
			}//end for
			pstmt.setString(1, names);  //,로 구분된 문자열을 대표자명에 insert 만약 김경태 윤상준 두명의 대표자면 DB에는 "김경태,윤상준" 이렇게 CSV데이터인 문자열로 한번에 들어감 
			// 나중에 select으로 화면에 뿌릴 때 CSV데이터를 spilt으로 쪼개서 배열로 다시 저장하고 뿌려줘야 할듯?
			
			pstmt.executeQuery();
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
			
		}//end finally
		
	}//end insertRepresent
	
	
	// 기업정보 수정하기 전 select
	public AdminCorpVO selectCorp(int num) throws SQLException {
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		AdminCorpVO acVO = null;

		try {
			con = dbCon.getConn();

			StringBuilder selectEdit = new StringBuilder();
			selectEdit.append(
					"    select corp.name, corp.type, corp.business_num, corp.field, corp.homepage, corp.establish_year, representative.name AS rep_name, corp.emp, corp.zipcode, corp.addr, corp.detail_addr, corp.logo ")
					.append("    from CORP join representative")
					.append("    on corp.corp_num = representative.corp_num  ").append("    where corp.corp_num = ?");

			pstmt = con.prepareStatement(selectEdit.toString());

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				acVO = new AdminCorpVO();
				acVO.setName(rs.getString("name"));
				acVO.setType(rs.getString("type"));
				acVO.setBusinessNum(rs.getString("business_num"));
				acVO.setField(rs.getString("field"));
				acVO.setHomepage(rs.getString("homepage"));
				acVO.setEstablishYear(rs.getDate("establish_year"));

				// 대표자 이름을 가져와서 배열에 추가
				String[] representativeNames = { rs.getString("rep_name") };
				acVO.setRepresentativeName(representativeNames);

				acVO.setEmp(rs.getInt("emp"));
				acVO.setZipcode(rs.getInt("zipcode"));
				acVO.setAddr(rs.getString("addr"));
				acVO.setDetailAddr(rs.getString("detail_addr"));
				acVO.setLogo(rs.getString("logo"));
			} // end while
		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally
		return acVO;
	}// selectCorp

	// 기업 수정
	public int updateCorp(AdminCorpVO acVO) throws SQLException {
		int result;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dbCon.getConn();
			StringBuilder updateCorp = new StringBuilder();
			updateCorp
			.append("    update corp   ")
			.append("    set name=?, type=?, business_num=?, field=?, homepage=?, establish_year=?, emp=?, zipcode=?, addr=?, detail_addr=?, logo=?  ")
			.append("    where corp_num = ?  ");

			pstmt = con.prepareStatement(updateCorp.toString());

			pstmt.setString(1, acVO.getName());
			pstmt.setString(2, acVO.getType());
			pstmt.setString(3, acVO.getBusinessNum());
			pstmt.setString(4, acVO.getField());
			pstmt.setString(5, acVO.getHomepage());
			pstmt.setDate(6, acVO.getEstablishYear());
			pstmt.setInt(7, acVO.getEmp());
			pstmt.setInt(8, acVO.getZipcode());
			pstmt.setString(9, acVO.getAddr());
			pstmt.setString(10, acVO.getDetailAddr());
			pstmt.setString(11, acVO.getLogo());
			pstmt.setInt(12, acVO.getNum());

			result = pstmt.executeUpdate();
		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally
		return result;
	}// updateCorp

	public void updateRepresent(AdminCorpVO acVO)throws SQLException {
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			
			con=dbCon.getConn();
			String updateRepresent="insert into representative(num, name, corp_num) values(SEQ_REPRESENT.nextval, ? , ?)";
			
			pstmt =con.prepareStatement(updateRepresent);
			
			String[] representativeName = acVO.getRepresentativeName(); // acVO에 대표자이름이 배열로 저장되어 있어서 배열의 representativeName으로 받고
			String names="";
			int len=representativeName.length; //representativeName의 길이만큼 for문 돌릴꺼라 int데이터 형으로 받고
			for (int i=0;i<len;i++) { 
			    names+=representativeName[i];  //for문 돌려서 0번방 부터 끝까지 모든 이름을 names라는 String데이터형에 저장하고
			    if (i<len - 1) {
			        names+=",";  // CSV데이터로 사용하기 위해 이름은 ,로 구분하게 하고
			    }//end if
			}//end for
			pstmt.setString(1, names);  //,로 구분된 문자열을 대표자명에 insert 만약 김경태 윤상준 두명의 대표자면 DB에는 "김경태,윤상준" 이렇게 CSV데이터인 문자열로 한번에 들어감 
			pstmt.setInt(2, acVO.getNum());
			// 나중에 select으로 화면에 뿌릴 때 CSV데이터를 spilt으로 쪼개서 배열로 다시 저장하고 뿌려줘야 할듯?
			pstmt.executeQuery();
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
	}//end updateRepresent
	
	public int deleteRepresent(int num) throws SQLException {
		int result;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dbCon.getConn();
			StringBuilder deleteCorp = new StringBuilder();
			deleteCorp
			.append("    delete from representative   ")
			.append("    where corp_num = ?  ");

			pstmt = con.prepareStatement(deleteCorp.toString());

			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();
		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally
		return result;
	}// deleteRepresent

	/*
	 * // 대표자 수정 public int updateRepresent(AdminCorpVO acVO) throws SQLException {
	 * int result;
	 * 
	 * DbConnection dbCon = DbConnection.getInstance(); Connection con = null;
	 * PreparedStatement pstmt = null;
	 * 
	 * try { con = dbCon.getConn(); StringBuilder updateRepresent = new
	 * StringBuilder(); updateRepresent .append("    update representative    ")
	 * .append("    set name = ?    ") .append("    where corp_num = ?    ");
	 * 
	 * pstmt = con.prepareStatement(updateRepresent.toString());
	 * 
	 * pstmt.setString(1, acVO.getName()); pstmt.setInt(2, acVO.getNum());
	 * 
	 * result = pstmt.executeUpdate(); } finally { dbCon.dbClose(null, pstmt, con);
	 * } // end finally return result; }// updateRepresent
	 */
	// 기업 삭제
	public int deleteCorp(int num) throws SQLException {
		int result;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dbCon.getConn();
			StringBuilder deleteCorp = new StringBuilder();
			deleteCorp.append("    delete from corp   ").append("    where corp_num = ?  ");

			pstmt = con.prepareStatement(deleteCorp.toString());

			pstmt.setInt(1, num);

			result = pstmt.executeUpdate();
		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally
		return result;
	}// deleteCorp
}// class
