package kr.koreait.Utill;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;



//이곳에서는 다른곳에서 다쓸수 있는 목적으로 만드는 메소드는 public static을 넣어줘야한다.

//다른곳에서 uploadFile을 쓰기위해 utill패키지를 따로만든다.
public class FileUtills {
	
	//ctrl Shift r  톰캣  web에서 mime 타입 확인 가능
	private static Map<String,MediaType> mediaMap;
	static {
		mediaMap = new HashMap<String, MediaType>();
		//이미지 확장자가 추가되면 여기다 추카하면된다.
		//jpg가 들어오면 MediaType.IMAGE_JPEG를 받는다는 의미이다.
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("JPEG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
		
	}
	public static MediaType getMediaType(String ext) {
		return mediaMap.get(ext.toUpperCase());
	}
	
	public static String uploadFile(MultipartFile file,String uploadPath, int idx) throws IOException {
		String media = file.getOriginalFilename();
	//상품 등록 중복 방지	
		String filename = System.currentTimeMillis()+media.substring(media.lastIndexOf("."));
		//파일업로드
		File target = new File(uploadPath, filename);
		FileCopyUtils.copy(file.getBytes(), target);
		
		return filename;
	}
	
	//확장자명 따오는 메소드
		private static String getFileExtension(String filename) {
			return filename.substring(filename.lastIndexOf(".")+1);
		}
}
