package util;

import java.io.*;

public class FileUtil {

	public static void saveImage(String fname, byte[] data)
	throws IOException {
		String filePath = "C:\\photos";
		File f = new File(filePath);
		if (!f.exists()) f.mkdir();
		f = new File(fname);
		FileOutputStream out = new FileOutputStream(f);
		out.write(data);
		out.close();
	}
}
