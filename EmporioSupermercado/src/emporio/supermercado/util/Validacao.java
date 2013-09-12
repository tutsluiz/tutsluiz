package emporio.supermercado.util;

import java.util.GregorianCalendar;
import java.util.InputMismatchException;
import java.util.regex.Pattern;

public class Validacao {

	public static boolean validaData(String data) {
		GregorianCalendar calendar = new GregorianCalendar();
		int dia = 0, mes = 0, ano = 0;
		String diaStr = data.substring(0, 2);
		String mesStr = data.substring(3, 5);
		String anoStr = data.substring(6, 10);
		try {
			dia = Integer.parseInt(diaStr);
			mes = Integer.parseInt(mesStr);
			ano = Integer.parseInt(anoStr);
		} catch (Exception e) {
			return false;
		}
		if (dia < 1 || mes < 1 || ano < 1)
			return false;
		else if (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8
				|| mes == 10 || mes == 12)
			if (dia <= 31)
				return true;
			else
				return false;
		else if (mes == 4 || mes == 6 || mes == 9 || mes == 11)
			if (dia <= 30)
				return true;
			else
				return false;
		else if (mes == 2)
			if (calendar.isLeapYear(ano))
				if (dia <= 29)
					return true;
				else
					return false;
			else if (dia <= 28)
				return true;
			else
				return false;
		else if (mes > 12)
			return false;
		return true;
	}

	public static boolean isCNPJ(String CNPJ) {
		System.out.println(CNPJ);
		CNPJ = CNPJ.replace(".", "");
		CNPJ = CNPJ.replace("-", "");
		CNPJ = CNPJ.replace("/", "");
		// considera-se erro CNPJ's formados por uma sequencia de numeros iguais
		if (CNPJ.equals("00000000000000") || CNPJ.equals("11111111111111")
				|| CNPJ.equals("22222222222222")
				|| CNPJ.equals("33333333333333")
				|| CNPJ.equals("44444444444444")
				|| CNPJ.equals("55555555555555")
				|| CNPJ.equals("66666666666666")
				|| CNPJ.equals("77777777777777")
				|| CNPJ.equals("88888888888888")
				|| CNPJ.equals("99999999999999") || (CNPJ.length() != 14))
			return (false);

		char dig13, dig14;
		int sm, i, r, num, peso;

		// "try" - protege o código para eventuais erros de conversao de tipo
		// (int)
		try {
			// Calculo do 1o. Digito Verificador
			sm = 0;
			peso = 2;
			for (i = 11; i >= 0; i--) {
				// converte o i-ésimo caractere do CNPJ em um número:
				// por exemplo, transforma o caractere '0' no inteiro 0
				// (48 eh a posição de '0' na tabela ASCII)
				num = (int) (CNPJ.charAt(i) - 48);
				sm = sm + (num * peso);
				peso = peso + 1;
				if (peso == 10)
					peso = 2;
			}

			r = sm % 11;
			if ((r == 0) || (r == 1))
				dig13 = '0';
			else
				dig13 = (char) ((11 - r) + 48);

			// Calculo do 2o. Digito Verificador
			sm = 0;
			peso = 2;
			for (i = 12; i >= 0; i--) {
				num = (int) (CNPJ.charAt(i) - 48);
				sm = sm + (num * peso);
				peso = peso + 1;
				if (peso == 10)
					peso = 2;
			}

			r = sm % 11;
			if ((r == 0) || (r == 1))
				dig14 = '0';
			else
				dig14 = (char) ((11 - r) + 48);

			// Verifica se os dígitos calculados conferem com os dígitos
			// informados.
			if ((dig13 == CNPJ.charAt(12)) && (dig14 == CNPJ.charAt(13)))
				return (true);
			else
				return (false);
		} catch (InputMismatchException erro) {
			return (false);
		}
	}
	
	
	public static boolean validaEmail(String email) {
		Pattern pattern = java.util.regex.Pattern.compile("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
		
		if(!"".equals(email) && !pattern.matcher(email).matches()) {
	      return false;
	    }
	    
	    return true; 
	 }
	
	public static boolean validaPreco(String preco) {
		
		Pattern pattern = java.util.regex.Pattern.compile("[0-9]+,[0-9]+");
		
	    if (pattern.matcher(preco).matches()) {
	    	return false;
	    }
	    
	    return true;
	}
	
	public static boolean validaCampoNumero(String str) {
		
		Pattern pattern = java.util.regex.Pattern.compile("[0-9]+");
		
		if (pattern.matcher(str).matches()) {
	    	return false;
	    }
	    
	    return true;
	}
	
}
