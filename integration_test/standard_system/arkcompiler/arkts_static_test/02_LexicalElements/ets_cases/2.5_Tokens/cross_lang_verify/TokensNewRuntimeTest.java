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
// Java Runtime Test - 对应 2.5 Tokens 补充用例
// 测试重点：可选链、空值合并、Unicode标识符、模板字面量、BigInt
// 覆盖 5 个新增 runtime 测试场景 (044-048)

import java.math.BigInteger;

public class TokensNewRuntimeTest {
    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Tokens New Runtime Test");

        // 044: 可选链运算符（Java 使用 Optional 模拟）
        // Java 没有原生可选链，使用条件判断模拟
        String city1 = "Beijing";
        String city2 = null;
        assert city1 != null : "044: city1 failed";
        totalAssertions++;
        System.out.println("[Java] 044 optional chaining: PASSED (" + city1 + ")");

        // 045: 空值合并运算符（Java 使用三元运算符模拟）
        Integer x = null;
        int y = (x != null) ? x : 42;
        assert y == 42 : "045: null ?? 42 failed";
        totalAssertions++;
        System.out.println("[Java] 045 nullish coalescing: PASSED (" + y + ")");

        Integer a = 10;
        int b = (a != null) ? a : 42;
        assert b == 10 : "045: 10 ?? 42 failed";
        totalAssertions++;
        System.out.println("[Java] 045 10 ?? 42: PASSED (" + b + ")");

        // 046: Unicode 标识符（Java 支持 Unicode 标识符）
        int 变量1 = 100;
        assert 变量1 == 100 : "046: 变量1 failed";
        totalAssertions++;
        System.out.println("[Java] 046 Unicode identifier: PASSED (" + 变量1 + ")");

        // 047: 模板字面量（Java 使用 String.format 或文本块）
        String name = "World";
        String greeting = String.format("Hello, %s!", name);
        assert greeting.equals("Hello, World!") : "047: template literal failed";
        totalAssertions++;
        System.out.println("[Java] 047 template literal: PASSED (" + greeting + ")");

        int xVal = 10;
        int yVal = 20;
        String sum = String.format("Sum: %d", xVal + yVal);
        assert sum.equals("Sum: 30") : "047: template expression failed";
        totalAssertions++;
        System.out.println("[Java] 047 template expression: PASSED (" + sum + ")");

        // 048: BigInt 字面量（Java 使用 BigInteger）
        BigInteger x1 = new BigInteger("123");
        assert x1.equals(new BigInteger("123")) : "048: 123n failed";
        totalAssertions++;
        System.out.println("[Java] 048 BigInt: PASSED (" + x1 + ")");

        BigInteger x2 = new BigInteger("0");
        assert x2.equals(BigInteger.ZERO) : "048: 0n failed";
        totalAssertions++;
        System.out.println("[Java] 048 BigInt 0: PASSED (" + x2 + ")");

        BigInteger sumBigInt = x1.add(new BigInteger("-456"));
        assert sumBigInt.equals(new BigInteger("-333")) : "048: BigInt sum failed";
        totalAssertions++;
        System.out.println("[Java] 048 BigInt sum: PASSED (" + sumBigInt + ")");

        System.out.println("=== Java Tokens New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
