package com.dzx.express.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;


import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

public class MyBatisXmlGenerator {
	public static void main(String[] args) {
		try {
			List<String> warnings = new ArrayList<String>();
			boolean overwrite = true;
			// 读取配置文件
			InputStream configFile = MyBatisXmlGenerator.class.getClassLoader()
					.getResourceAsStream("MyBatisGeneratorConfig.xml");
			ConfigurationParser cp = new ConfigurationParser(warnings);
			Configuration config;

			config = cp.parseConfiguration(configFile);

			DefaultShellCallback callback = new DefaultShellCallback(overwrite);
			MyBatisGenerator myBatisGenerator;

			myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
			myBatisGenerator.generate(null);
			System.out.println("Generator job done!");
			// 打印结果
			for (String str : warnings) {
				System.out.println(str);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
