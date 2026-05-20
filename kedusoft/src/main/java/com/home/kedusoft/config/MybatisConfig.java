package com.home.kedusoft.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.type.JdbcType;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Configuration
@MapperScan(basePackages = "com.home.kedusoft.mapper")
@RequiredArgsConstructor
@Slf4j
public class MybatisConfig {
	
	private final ApplicationContext applicationContext;

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.hikari")
    HikariConfig hikariconfig() {
		return new HikariConfig();
	}

    @Bean
    DataSource dataSource() {
		return new HikariDataSource(hikariconfig());
	}

    @Bean
    SqlSessionFactory sqlSessionFactory() throws Exception {

		SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
		sessionFactoryBean.setDataSource(dataSource());
		//sessionFactoryBean.setMapperLocations(applicationContext.getResource("classpath:mapper/*.xml"));
		//sessionFactoryBean.setTypeAliasesPackage( "com.association.cica" );
		
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		Resource[] resource = resolver.getResources("classpath:mapper/*.xml");
		sessionFactoryBean.setMapperLocations(resource);
		sessionFactoryBean.setTypeAliasesPackage("com.home.kedusoft.**.domain,com.home.kedusoft.**.util");
		
		SqlSessionFactory sqlsessionFactory = null;
		try {
			sqlsessionFactory = sessionFactoryBean.getObject();
			sqlsessionFactory.getConfiguration().setDefaultStatementTimeout(15000);//15초 데이터베이스로의 응답을 얼마나 오래 기다릴지를 판단하는 타임아웃을 설정
			sqlsessionFactory.getConfiguration().setMapUnderscoreToCamelCase(true);//map 리턴시 null  경우 누락되는 현상이 나오는데 이를 해결하기 위해
			sqlsessionFactory.getConfiguration().setCallSettersOnNulls(true);
			sqlsessionFactory.getConfiguration().setJdbcTypeForNull(JdbcType.NULL);
			return sqlsessionFactory;
		} catch (Exception e) {
			e.printStackTrace();
		}
		   return null;
    }
}
