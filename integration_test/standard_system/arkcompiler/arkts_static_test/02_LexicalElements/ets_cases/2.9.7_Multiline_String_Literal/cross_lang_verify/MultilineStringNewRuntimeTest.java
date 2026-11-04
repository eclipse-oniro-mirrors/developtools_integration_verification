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
// Java Runtime Test - 对应 2.9.7 Multiline String Literal 补充用例
// 测试重点：多行字符串插值、长度、比较、函数使用
// 覆盖 4 个新增 runtime 测试场景 (013-016)

public class MultilineStringNewRuntimeTest {
    static String getMultiline() {
        return "Line 1\nLine 2";
    }

    static String printMultiline(String s) {
        return s;
    }

    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Multiline String Literal New Runtime Test");

        // 013: 多行字符串插值
        String name = "World";
        String s1 = "Hello, " + name + "!";
        assert s1.equals("Hello, World!") : "013: interpolation failed";
        totalAssertions++;
        System.out.println("[Java] 013 interpolation: PASSED (" + s1 + ")");

        int x = 10;
        int y = 20;
        String s2 = "Sum: " + (x + y);
        assert s2.equals("Sum: 30") : "013: expression interpolation failed";
        totalAssertions++;
        System.out.println("[Java] 013 expression interpolation: PASSED (" + s2 + ")");

        // 014: 多行字符串长度
        String s3 = "Hello\nWorld";
        assert s3.length() == 11 : "014: multiline length failed";
        totalAssertions++;
        System.out.println("[Java] 014 multiline length: PASSED (" + s3.length() + ")");

        String s4 = "";
        assert s4.length() == 0 : "014: empty length failed";
        totalAssertions++;
        System.out.println("[Java] 014 empty length: PASSED (" + s4.length() + ")");

        String s5 = "Hello";
        assert s5.length() == 5 : "014: single line length failed";
        totalAssertions++;
        System.out.println("[Java] 014 single line length: PASSED (" + s5.length() + ")");

        // 015: 多行字符串比较
        String s6 = "Hello\nWorld";
        String s7 = "Hello\nWorld";
        assert s6.equals(s7) : "015: equality failed";
        totalAssertions++;
        System.out.println("[Java] 015 equality: PASSED");

        String s8 = "Hello\nTest";
        assert !s6.equals(s8) : "015: inequality failed";
        totalAssertions++;
        System.out.println("[Java] 015 inequality: PASSED");

        // 016: 多行字符串在函数中
        String s9 = getMultiline();
        String expected = "Line 1\nLine 2";
        assert s9.equals(expected) : "016: getMultiline failed";
        totalAssertions++;
        System.out.println("[Java] 016 getMultiline: PASSED (" + s9 + ")");

        String s10 = "Hello\nWorld";
        String s11 = printMultiline(s10);
        assert s11.equals(s10) : "016: printMultiline failed";
        totalAssertions++;
        System.out.println("[Java] 016 printMultiline: PASSED (" + s11 + ")");

        System.out.println("=== Java Multiline String Literal New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
