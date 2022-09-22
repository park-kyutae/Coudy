package kr.spring.config;

import kr.spring.study.plan.artgumentResolver.LoginArgumentResolver;
import kr.spring.study.plan.testUtil.LoginTestInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import kr.spring.interceptor.LoginCheckInterceptor;
import kr.spring.interceptor.WriterCheckInterceptor;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
				.order(1)
		        .addPathPatterns("/member/myPage.do")
		        .addPathPatterns("/member/update.do")
		        .addPathPatterns("/member/delete.do")
				.addPathPatterns("/study/studydetail.do")
				.addPathPatterns("/techblog/techblogWrite.do")
				.addPathPatterns("/member/changePassword.do")
				.addPathPatterns("/techblog/techblogUpdate.do")

				.addPathPatterns("/techblog/techblogDelete.do")
				.addPathPatterns("/notice/Write.do")
				.addPathPatterns("/notice/Update.do")
				.addPathPatterns("/notice/Delete.do")
				.addPathPatterns("/teamblog/Write.do")
				.addPathPatterns("/teamblog/Update.do")
				.addPathPatterns("/teamblog/Delete.do");

		registry.addInterceptor(interceptor)
				.order(2)
		.addPathPatterns("/techblog/techblogUpdate.do")
		.addPathPatterns("/techblog/techblogDelete.do");
		//TODO 로그인 기능 완성 시 삭제
		registry.addInterceptor(new LoginTestInterceptor())
				.order(3)
				.addPathPatterns(Arrays.asList("/study/plan/**","/study/todo/**"));


	}

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		resolvers.add(new LoginArgumentResolver());
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


