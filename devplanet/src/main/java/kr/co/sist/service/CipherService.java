package kr.co.sist.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import kr.co.sist.admin.vo.AdminUserVO;
import kr.co.sist.util.cipher.DataEncrypt;

public class CipherService {
	public void updateUser(AdminUserVO auVO) throws SQLException, UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException {
		DataEncrypt de = new DataEncrypt("FsRt4SfY4US0IWtK4JPJsw==");
		
		auVO.setName(de.encryption(auVO.getName() ));
		auVO.setEmail(de.encryption(auVO.getEmail() ));
		auVO.setTel(de.encryption(auVO.getTel()));
		auVO.setAddr(de.encryption(auVO.getAddr()));
	}
}
