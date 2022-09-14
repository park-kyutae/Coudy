package kr.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import kr.spring.interceptor.LoginCheckInterceptor;
import kr.spring.interceptor.WriterCheckInterceptor;

//자바코드 기반 설정 클래스

@Configuration
public class AppConfig implements WebMvcConfigurer{
	
	WriterCheckInterceptor interceptor;
	//WriterCheckInterceptor에서 BoardService 객체를
	//주입받아야 하기때문에 Bean 객체로 등록함
	@Bean
	public WriterCheckInterceptor interceptor() {
		interceptor = new WriterCheckInterceptor();
		return interceptor;
	}

	//인터셉터 지정
	@Override
	public void addInterceptors(
			       InterceptorRegistry registry) {
		registry.addInterceptor(
				    new LoginCheckInterceptor())
		        .addPathPatterns("/member/myPage.do")
				.addPathPatterns("/study/studygroupcreate.do")
				.addPathPatterns("/techblog/techblogWrite.do")
				.addPathPatterns("/techblog/techblogUpdate.do")
				.addPathPatterns("/techblog/techblogDelete.do");
		
		registry.addInterceptor(interceptor)
		.addPathPatterns("/techblog/techblogUpdate.do")
		.addPathPatterns("/techblog/techblogDelete.do");
		
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = 
				new TilesConfigurer();
		
		//해당 경로에 xml 설정 파일을 넣음
		configurer.setDefinitions(new String[] {
				"/WEB-INF/tiles-def/main.xml",
				"/WEB-INF/tiles-def/first.xml",
				"/WEB-INF/tiles-def/second.xml",
				"/WEB-INF/tiles-def/third.xml",
				"/WEB-INF/tiles-def/forth.xml",
				"/WEB-INF/tiles-def/fifth.xml",
				"/WEB-INF/tiles-def/sixth.xml",
				"/WEB-INF/tiles-def/techblog.xml"
		});
		configurer.setCheckRefresh(true);
		return configurer;
	}
	
	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver tilesViewResolver =
				new TilesViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}
	
}


