package practice.controller.chap06;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample")
@Log4j
public class SampleController {

	@RequestMapping("")
	public void basic() {
		log.info("basic.......");
	}

	@RequestMapping(value = "/basic", method = { RequestMethod.GET, RequestMethod.POST })
	public void basicGet() {
		log.info("basic get.......");
	}

	@GetMapping("/basicOnlyGet")
	public void basicGet2() {

		// @GetMapping, @PostMapping, @DeleteMapping, @PutMapping,
		log.info("basicGet1 basicOnlyGet URL.......");
	}

	// 컨트롤러 메소드의 변환타입을 String으로 설정한 경우
	// 해당 스트링은 사용자 브라우저로 전달된 동적 HTML을 생성하는
	// JSP 파일이름(확장자가 제거된)이름이어야 합니다.
	// Servlet-context.xml 설명 참고
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		// public void ex01(SampleDTO dto) {
		log.info("" + dto);
		System.out.println(dto.getName());
		System.out.println(dto.getAge());

		return "ex01";
	}

	@GetMapping("ex02")
	public String ex02(@RequestParam("name") String name1, 
						@RequestParam("age") int age1) {

//		log.info("name:" + name);
//		log.info("age:" + age);
		System.out.println("name:" + name1);
		System.out.println("age:" + age1);

		return "ex01";
	}

}
