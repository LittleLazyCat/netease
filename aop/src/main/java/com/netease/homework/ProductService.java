package com.netease.homework;

import org.springframework.stereotype.Component;

@Component
public class ProductService {
	public void add(String productname) throws Exception {
        System.out.println("��Ӳ�Ʒ:" + productname);
        throw new Exception("����");
    }
    public void edit(String productname) {
        System.out.println("���²�Ʒ:" + productname);
    }
    public void del(String productname) {
        System.out.println("ɾ����Ʒ:" + productname);
    }
    public void find(String productname) {
        System.out.println("��ѯ��Ʒ:" + productname);
    }
}
