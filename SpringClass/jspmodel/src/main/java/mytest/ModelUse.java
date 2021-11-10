package mytest;

import java.util.HashMap;
import java.util.Map;

public class ModelUse {

	public static void main(String[] args) {
		Map<String, String> model = new HashMap<>();
		String sReturn = root(model);
		printData(sReturn, model);
	}
	
	
}
