package com.kh.dc.common.summernote;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SummerNoteController {

	@RequestMapping("common/summernote/convertImage.do")
	@ResponseBody
	public String convertImage(HttpSession session, @RequestParam("file") MultipartFile file) {
		
		// 1. 파일을 저장할 경로 생성
		String realPath = "/resources/upload/boardImg";
		String saveDir = session.getServletContext().getRealPath(realPath);
		String uploadPath = session.getServletContext().getContextPath() + realPath;
		
		// 2. 폴더 유무 확인 후 생성
		File dir = new File(saveDir);
		if (dir.exists() == false) dir.mkdirs();

		// 3. 원본 이름 가져오기
		String originName = file.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf(".")+1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		
		int rnNum = (int)(Math.random() * 1000);
		
		// 4. 서버에서 저장 후 관리할 파일 명
		String renamedName = sdf.format(new Date()) + "_" + rnNum + "." + ext;
		
		// 5. 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
		try {
			file.transferTo(new File(saveDir + "/" + renamedName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("uploadPath: "+uploadPath);
		System.out.println("renamedName: "+renamedName);
		
		return uploadPath + "/" + renamedName;
	}

}
