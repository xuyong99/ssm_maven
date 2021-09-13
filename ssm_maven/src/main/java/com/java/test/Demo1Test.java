package com.java.test;

/**
 * description：
 * author：丁鹏
 * date：14:50
 */
public class Demo1Test {

    public static void main(String[] args) {
        String str = "1,2,3,10,11,";
        System.out.println(str.matches("(\\d,){1,10}"));
    }

}
