package config;

import java.util.Base64;

public class Base64Config {
	
	private final Base64.Decoder decoder = Base64.getDecoder();
	private final Base64.Encoder encoder = Base64.getEncoder();
	
	public String encode(String str) {
		return encoder.encodeToString(str.getBytes());
	}
	
	public String decode(String str) {
		return new String(decoder.decode(str));
	}

}
