package emporio.supermercado.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class Util {
	
	public static Boolean isEmpty(Object obj) {
		return (obj == null) || ("".equals(obj));
	}
	
	
	public static String encripta(String senha) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			BigInteger hash = new BigInteger(1, md.digest(senha.getBytes()));
			return hash.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return senha;
		}
	}
	
	public static void main(String[] args) {
		System.out.println(Util.encripta("123456")); /* gera a senha que esta entre "" */
	}
	
}