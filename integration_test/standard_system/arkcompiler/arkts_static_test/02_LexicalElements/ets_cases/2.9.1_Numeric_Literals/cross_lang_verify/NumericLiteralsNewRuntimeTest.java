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
// Java Runtime Test - 对应 2.9.1 Numeric Literals 补充用例
// 测试重点：负数字面量、零的不同表示、科学计数法变体、long 最大值
// 覆盖 4 个新增 runtime 测试场景 (043-046)

import java.math.BigInteger;

public class NumericLiteralsNewRuntimeTest {
    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Numeric Literals New Runtime Test");

        // 043: 负数字面量
        int x1 = -42;
        assert x1 == -42 : "043: -42 failed";
        totalAssertions++;
        System.out.println("[Java] 043 -42: PASSED (" + x1 + ")");

        int x2 = -0xFF;
        assert x2 == -255 : "043: -0xFF failed";
        totalAssertions++;
        System.out.println("[Java] 043 -0xFF: PASSED (" + x2 + ")");

        double x3 = -3.14;
        assert x3 == -3.14 : "043: -3.14 failed";
        totalAssertions++;
        System.out.println("[Java] 043 -3.14: PASSED (" + x3 + ")");

        BigInteger x4 = new BigInteger("-123");
        assert x4.equals(new BigInteger("-123")) : "043: -123n failed";
        totalAssertions++;
        System.out.println("[Java] 043 -123n: PASSED (" + x4 + ")");

        // 044: 零的不同表示
        int x5 = 0;
        int x6 = 0x0;
        int x7 = 00;  // Java uses leading 0 for octal
        int x8 = 0b0;
        double x9 = 0.0;

        assert x5 == 0 : "044: 0 failed";
        totalAssertions++;
        System.out.println("[Java] 044 0: PASSED (" + x5 + ")");

        assert x6 == 0 : "044: 0x0 failed";
        totalAssertions++;
        System.out.println("[Java] 044 0x0: PASSED (" + x6 + ")");

        assert x7 == 0 : "044: 0o0 failed";
        totalAssertions++;
        System.out.println("[Java] 044 0o0: PASSED (" + x7 + ")");

        assert x8 == 0 : "044: 0b0 failed";
        totalAssertions++;
        System.out.println("[Java] 044 0b0: PASSED (" + x8 + ")");

        assert x9 == 0.0 : "044: 0.0 failed";
        totalAssertions++;
        System.out.println("[Java] 044 0.0: PASSED (" + x9 + ")");

        // 045: 科学计数法变体
        double x10 = 1.5E10;
        assert x10 == 15000000000.0 : "045: 1.5E10 failed";
        totalAssertions++;
        System.out.println("[Java] 045 1.5E10: PASSED (" + x10 + ")");

        double x11 = 1e-5;
        assert x11 == 0.00001 : "045: 1e-5 failed";
        totalAssertions++;
        System.out.println("[Java] 045 1e-5: PASSED (" + x11 + ")");

        double x12 = 1.5e+10;
        assert x12 == 15000000000.0 : "045: 1.5e+10 failed";
        totalAssertions++;
        System.out.println("[Java] 045 1.5e+10: PASSED (" + x12 + ")");

        // 046: long 最大值
        long x13 = 9223372036854775807L;
        assert x13 == 9223372036854775807L : "046: long max failed";
        totalAssertions++;
        System.out.println("[Java] 046 long max: PASSED (" + x13 + ")");

        long x14 = -9223372036854775808L;
        assert x14 == -9223372036854775808L : "046: long min failed";
        totalAssertions++;
        System.out.println("[Java] 046 long min: PASSED (" + x14 + ")");

        System.out.println("=== Java Numeric Literals New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
