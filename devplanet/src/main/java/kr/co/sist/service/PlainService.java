package kr.co.sist.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

import kr.co.sist.admin.vo.AdminUserVO;
import kr.co.sist.admin.vo.SelectUserVO;
import kr.co.sist.util.cipher.DataDecrypt;

public class PlainService {
	
	public void selectUser(List<SelectUserVO> dataList) throws SQLException, UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException {
		DataDecrypt dd=new DataDecrypt("FsRt4SfY4US0IWtK4JPJsw==");
		
		for(SelectUserVO sVO: dataList) {
			sVO.setTel( dd.decryption( sVO.getTel() ));
			sVO.setName( dd.decryption( sVO.getName() ));
			sVO.setAddr( dd.decryption( sVO.getAddr()));
		}// end for
	}// selectUser
	
	
	public void selectEditUser(AdminUserVO auVO) throws SQLException, UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException {
		DataDecrypt dd=new DataDecrypt("FsRt4SfY4US0IWtK4JPJsw=="); 
		
		auVO.setName(dd.decryption(auVO.getName() ));
		auVO.setEmail(dd.decryption(auVO.getEmail() ));
		auVO.setTel(dd.decryption(auVO.getTel()));
		auVO.setAddr(dd.decryption(auVO.getAddr()));
	}
	 
}
