package com.netease.homework;

import org.springframework.stereotype.Component;

@Component
public class UserService {
	public void add(String username) throws Exception {
        System.out.println("����û�:" + username);
        throw new Exception("����");
    }
    public void edit(String username) {
        System.out.println("�����û�:" + username);
    }
    public void del(String username) {
        System.out.println("ɾ���û�:" + username);
    }
    public void find(String username) {
        System.out.println("��ѯ�û�:" + username);
    }
}
