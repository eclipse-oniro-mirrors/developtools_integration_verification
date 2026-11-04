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
// Java Runtime Test - 对应 2.9.2 Integer Literals 补充用例
// 测试重点：零的不同表示、负数进制、long 溢出、边界运算、类型转换
// 覆盖 5 个新增 runtime 测试场景 (026-030)

public class IntegerLiteralsNewRuntimeTest {
    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Integer Literals New Runtime Test");

        // 026: 零的不同进制表示
        int x1 = 0;
        int x2 = 0x0;
        int x3 = 00;  // Java uses leading 0 for octal
        int x4 = 0b0;

        assert x1 == 0 : "026: 0 failed";
        totalAssertions++;
        System.out.println("[Java] 026 0: PASSED (" + x1 + ")");

        assert x2 == 0 : "026: 0x0 failed";
        totalAssertions++;
        System.out.println("[Java] 026 0x0: PASSED (" + x2 + ")");

        assert x3 == 0 : "026: 0o0 failed";
        totalAssertions++;
        System.out.println("[Java] 026 0o0: PASSED (" + x3 + ")");

        assert x4 == 0 : "026: 0b0 failed";
        totalAssertions++;
        System.out.println("[Java] 026 0b0: PASSED (" + x4 + ")");

        // 027: 负数进制表示
        int x5 = -42;
        int x6 = -0xFF;
        int x7 = -077;  // Java uses leading 0 for octal
        int x8 = -0b1010;

        assert x5 == -42 : "027: -42 failed";
        totalAssertions++;
        System.out.println("[Java] 027 -42: PASSED (" + x5 + ")");

        assert x6 == -255 : "027: -0xFF failed";
        totalAssertions++;
        System.out.println("[Java] 027 -0xFF: PASSED (" + x6 + ")");

        assert x7 == -63 : "027: -0o77 failed";
        totalAssertions++;
        System.out.println("[Java] 027 -0o77: PASSED (" + x7 + ")");

        assert x8 == -10 : "027: -0b1010 failed";
        totalAssertions++;
        System.out.println("[Java] 027 -0b1010: PASSED (" + x8 + ")");

        // 028: long 溢出行为
        long x9 = Long.MAX_VALUE;
        assert x9 == 9223372036854775807L : "028: long max failed";
        totalAssertions++;
        System.out.println("[Java] 028 long max: PASSED (" + x9 + ")");

        long x10 = Long.MIN_VALUE;
        assert x10 == -9223372036854775808L : "028: long min failed";
        totalAssertions++;
        System.out.println("[Java] 028 long min: PASSED (" + x10 + ")");

        long x11 = Long.MAX_VALUE + 1;
        assert x11 == Long.MIN_VALUE : "028: long overflow failed";
        totalAssertions++;
        System.out.println("[Java] 028 long overflow: PASSED (" + x11 + ")");

        // 029: 边界运算
        int x12 = Integer.MAX_VALUE + 1;
        assert x12 == Integer.MIN_VALUE : "029: int max + 1 failed";
        totalAssertions++;
        System.out.println("[Java] 029 int max + 1: PASSED (" + x12 + ")");

        int x13 = Integer.MIN_VALUE - 1;
        assert x13 == Integer.MAX_VALUE : "029: int min - 1 failed";
        totalAssertions++;
        System.out.println("[Java] 029 int min - 1: PASSED (" + x13 + ")");

        // 030: 类型转换
        int x14 = 42;
        long x15 = x14;  // widening
        assert x15 == 42 : "030: int to long failed";
        totalAssertions++;
        System.out.println("[Java] 030 int to long: PASSED (" + x15 + ")");

        long x16 = 42;
        int x17 = (int) x16;  // narrowing
        assert x17 == 42 : "030: long to int failed";
        totalAssertions++;
        System.out.println("[Java] 030 long to int: PASSED (" + x17 + ")");

        long x18 = 2147483648L;
        int x19 = (int) x18;
        assert x19 == -2147483648 : "030: long to int overflow failed";
        totalAssertions++;
        System.out.println("[Java] 030 long to int overflow: PASSED (" + x19 + ")");

        System.out.println("=== Java Integer Literals New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
