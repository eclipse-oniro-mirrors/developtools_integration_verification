/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
// Java Runtime Test - 对应 2.9.6 String Literals 补充用例
// 测试重点：字符串插值、字符串方法、字符串条件表达式、字符串数组
// 覆盖 4 个新增 runtime 测试场景 (028-031)

public class StringLiteralsNewRuntimeTest {
    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] String Literals New Runtime Test");

        // 028: 字符串插值
        String name = "World";
        String greeting = "Hello, " + name + "!";
        assert greeting.equals("Hello, World!") : "028: interpolation failed";
        totalAssertions++;
        System.out.println("[Java] 028 interpolation: PASSED (" + greeting + ")");

        int x = 10;
        int y = 20;
        String sum = "Sum: " + (x + y);
        assert sum.equals("Sum: 30") : "028: expression interpolation failed";
        totalAssertions++;
        System.out.println("[Java] 028 expression interpolation: PASSED (" + sum + ")");

        // 029: 字符串方法
        String s1 = "Hello";
        String s2 = s1.substring(0, 3);
        assert s2.equals("Hel") : "029: substring failed";
        totalAssertions++;
        System.out.println("[Java] 029 substring: PASSED (" + s2 + ")");

        String s3 = s1.toUpperCase();
        assert s3.equals("HELLO") : "029: toUpperCase failed";
        totalAssertions++;
        System.out.println("[Java] 029 toUpperCase: PASSED (" + s3 + ")");

        String s4 = s1.toLowerCase();
        assert s4.equals("hello") : "029: toLowerCase failed";
        totalAssertions++;
        System.out.println("[Java] 029 toLowerCase: PASSED (" + s4 + ")");

        String s5 = "  Hello  ";
        String s6 = s5.trim();
        assert s6.equals("Hello") : "029: trim failed";
        totalAssertions++;
        System.out.println("[Java] 029 trim: PASSED (" + s6 + ")");

        String s7 = s1.replace("l", "L");
        assert s7.equals("HeLLo") : "029: replace failed";
        totalAssertions++;
        System.out.println("[Java] 029 replace: PASSED (" + s7 + ")");

        // 030: 字符串条件表达式
        String s8 = "Hello";
        int result1 = 0;
        if (s8.length() > 0) {
            result1 = 1;
        }
        assert result1 == 1 : "030: length > 0 failed";
        totalAssertions++;
        System.out.println("[Java] 030 length > 0: PASSED (" + result1 + ")");

        String s9 = "";
        int result2 = 0;
        if (s9.length() == 0) {
            result2 = 1;
        }
        assert result2 == 1 : "030: empty string failed";
        totalAssertions++;
        System.out.println("[Java] 030 empty string: PASSED (" + result2 + ")");

        // 031: 字符串数组
        String[] arr1 = {"Hello", "World", "Test"};
        assert arr1[0].equals("Hello") : "031: arr1[0] failed";
        totalAssertions++;
        System.out.println("[Java] 031 arr1[0]: PASSED (" + arr1[0] + ")");

        assert arr1.length == 3 : "031: arr1.length failed";
        totalAssertions++;
        System.out.println("[Java] 031 arr1.length: PASSED (" + arr1.length + ")");

        System.out.println("=== Java String Literals New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
