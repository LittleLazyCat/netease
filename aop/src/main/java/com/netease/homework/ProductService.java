package com.netease.homework;

import org.springframework.stereotype.Component;

@Component
public class ProductService {
	public void add(String productname) throws Exception {
        System.out.println("添加产品:" + productname);
        throw new Exception("测试");
    }
    public void edit(String productname) {
        System.out.println("更新产品:" + productname);
    }
    public void del(String productname) {
        System.out.println("删除产品:" + productname);
    }
    public void find(String productname) {
        System.out.println("查询产品:" + productname);
    }
}
