package com.spring5213.mypro00j.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
//import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
//import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@PropertySource("classpath:/jdbcConfig/jdbc.properties")  //properties 파일 읽어 옴
@MapperScan(basePackages= {"com.spring5213.mypro00j.mapper"}) //Mybatis-매퍼 인터페이스가 있는 패키지 지정
@EnableTransactionManagement  //<tx:annotation-driven/> 설정에 해당
public class MyMybatisConfig {


//필드에 저장
//    @Value( "${jdbcHikari.driverClassName}" )
//    @Value( "${jdbcHikariLog.driverClassName}" )
//    private String driverClassName;
//	
//    @Value( "${jdbcHikari.jdbcUrl}" )
//    @Value( "${jdbcHikariLog.jdbcUrl}" )
//    private String jdbcUrl;
//
//    @Value( "${jdbcHikari.username}" )
//    @Value( "${jdbcHikariLog.username}" )
//    private String username;
//	
//    @Value( "${jdbcHikari.password}" )
//    @Value( "${jdbcHikariLog.password}" )
//    private String password;
	
    //@Autowired
    private Environment env;

    public MyMybatisConfig(Environment env) {
        this.env = env;
    }

    @Bean
    public DataSource dataSource() {
    	
        HikariConfig hikariConfig = new HikariConfig();
//직접 설정        
//	      hikariConfig.setDriverClassName("oracle.jdbc.driver.OracleDriver"); //경고 발생
//        hikariConfig.setDriverClassName("oracle.jdbc.OracleDriver");        //경고 없음
//        hikariConfig.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:orcl"); 

//        hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
//        hikariConfig.setJdbcUrl("jdbc:log4jdbc:oracle:thin:@localhost:1521:orcl");

//        hikariConfig.setUsername("book_ex");
//        hikariConfig.setPassword("book_ex");

//        //필드값으로 설정        
//        hikariConfig.setDriverClassName(driverClassName);
//        hikariConfig.setJdbcUrl(jdbcUrl);
//        hikariConfig.setUsername(username);
//        hikariConfig.setPassword(password);

//Environment 객체의 getProperty()로 값을 읽어와 설정
//        hikariConfig.setDriverClassName(env.getProperty("jdbcHikari.driverClassName"));
//        hikariConfig.setJdbcUrl(env.getProperty("jdbcHikari.jdbcUrl"));
//        hikariConfig.setUsername(env.getProperty("jdbcHikari.username"));
//        hikariConfig.setPassword(env.getProperty("jdbcHikari.password"));

//개발용 드라이버 정보 설정
        hikariConfig.setDriverClassName(env.getProperty("jdbcHikariLog.driverClassName"));
        hikariConfig.setJdbcUrl(env.getProperty("jdbcHikariLog.jdbcUrl"));
        hikariConfig.setUsername(env.getProperty("jdbcHikariLog.username"));
        hikariConfig.setPassword(env.getProperty("jdbcHikariLog.password"));
        
        HikariDataSource dataSource = new HikariDataSource(hikariConfig);
        return dataSource;
    }

    @Bean(name="sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactory() throws Exception {


// 한 개의 매퍼구성 XML 파일 읽어 옴 - src/main/resources 폴더에 config/mybatis-config.xml 파일 존재할 경우
//      Resource configLocation = new ClassPathResource("config/mybatis-config.xml"); //문서에서는 구성 안함
  	
//여러 개의 Mybatis SQL매퍼파일(XML) 읽어 옴(방법1): ClassPathResource() 생성자 이용(다른 디렉토리에 파일이 존재할 경우 사용.
//      Resource[] mapperLocations2 = new Resource[] {
//              new ClassPathResource("mymappers/MyBoardMapper.xml"),   src/main/resources 폴더에 mapper/*.xml 파일 존재함
//              new ClassPathResource("mappers/MyReplyMapper.xml"),
//              new ClassPathResource("mapper/MyMemberMapper.xml")
//     	};

        
    	// 여러 개의 Mybatis SQL매퍼파일(XML) 읽어 옴(방법2-패턴사용할 수 있음) 
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        Resource[] mapperLocations = resolver.getResources("classpath:mymappers/*Mapper.xml");  // src/main/resources 폴더에 
                                                                                                // mymappers/*.xml 파일 존재함
        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(dataSource());

        //sqlSessionFactory.setConfigLocation(configLocation);  //MyBatis 구성XML의 내용 설정, 문서에서는 구성 안함
        sqlSessionFactory.setMapperLocations(mapperLocations);  //Mybatis SQL매퍼파일 설정

        
//        sqlSessionFactory.setMapperLocations(
//        	                new PathMatchingResourcePatternResolver()
//        	                    .getResources("classpath:mymappers/*Mapper.xml"));
        return (SqlSessionFactory) sqlSessionFactory.getObject();
    }
    
    @Bean
    public DataSourceTransactionManager txManager() {
    	return new DataSourceTransactionManager(dataSource());
    }
}
