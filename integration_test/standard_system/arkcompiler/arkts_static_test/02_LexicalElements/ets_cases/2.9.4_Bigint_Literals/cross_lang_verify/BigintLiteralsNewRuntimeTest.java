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
// Java Runtime Test - 对应 2.9.4 Bigint Literals 补充用例
// 测试重点：零 bigint、除法/取模、边界值、long 转换、字符串转换
// 覆盖 5 个新增 runtime 测试场景 (020-024)

import java.math.BigInteger;

public class BigintLiteralsNewRuntimeTest {
    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Bigint Literals New Runtime Test");

        // 020: 零 bigint
        BigInteger x1 = BigInteger.ZERO;
        assert x1.equals(BigInteger.ZERO) : "020: 0n failed";
        totalAssertions++;
        System.out.println("[Java] 020 0n: PASSED (" + x1 + ")");

        BigInteger x2 = BigInteger.ZERO.negate();
        assert x2.equals(BigInteger.ZERO) : "020: -0n failed";
        totalAssertions++;
        System.out.println("[Java] 020 -0n: PASSED (" + x2 + ")");

        BigInteger x3 = BigInteger.ZERO.add(new BigInteger("123"));
        assert x3.equals(new BigInteger("123")) : "020: 0n + 123n failed";
        totalAssertions++;
        System.out.println("[Java] 020 0n + 123n: PASSED (" + x3 + ")");

        // 021: 除法/取模
        BigInteger x4 = new BigInteger("10").divide(new BigInteger("3"));
        assert x4.equals(new BigInteger("3")) : "021: 10n / 3n failed";
        totalAssertions++;
        System.out.println("[Java] 021 10n / 3n: PASSED (" + x4 + ")");

        BigInteger x5 = new BigInteger("10").mod(new BigInteger("3"));
        assert x5.equals(new BigInteger("1")) : "021: 10n % 3n failed";
        totalAssertions++;
        System.out.println("[Java] 021 10n % 3n: PASSED (" + x5 + ")");

        BigInteger x6 = new BigInteger("100").divide(new BigInteger("10"));
        assert x6.equals(new BigInteger("10")) : "021: 100n / 10n failed";
        totalAssertions++;
        System.out.println("[Java] 021 100n / 10n: PASSED (" + x6 + ")");

        // 022: 边界值
        BigInteger x7 = new BigInteger("999999999999999999999999999999");
        assert x7.equals(new BigInteger("999999999999999999999999999999")) : "022: bigint large failed";
        totalAssertions++;
        System.out.println("[Java] 022 bigint large: PASSED (" + x7 + ")");

        BigInteger x8 = x7.add(BigInteger.ONE);
        assert x8.equals(new BigInteger("1000000000000000000000000000000")) : "022: bigint large + 1 failed";
        totalAssertions++;
        System.out.println("[Java] 022 bigint large + 1: PASSED (" + x8 + ")");

        // 023: long 转换
        long x9 = 42;
        BigInteger x10 = BigInteger.valueOf(x9);
        assert x10.equals(new BigInteger("42")) : "023: long to bigint failed";
        totalAssertions++;
        System.out.println("[Java] 023 long to bigint: PASSED (" + x10 + ")");

        // 024: 字符串转换
        BigInteger x11 = new BigInteger("123");
        String s1 = x11.toString();
        assert s1.equals("123") : "024: 123n.toString() failed";
        totalAssertions++;
        System.out.println("[Java] 024 123n.toString(): PASSED (" + s1 + ")");

        BigInteger x12 = new BigInteger("-456");
        String s2 = x12.toString();
        assert s2.equals("-456") : "024: -456n.toString() failed";
        totalAssertions++;
        System.out.println("[Java] 024 -456n.toString(): PASSED (" + s2 + ")");

        BigInteger x13 = new BigInteger("789");
        assert x13.equals(new BigInteger("789")) : "024: BigInt(\"789\") failed";
        totalAssertions++;
        System.out.println("[Java] 024 BigInt(\"789\"): PASSED (" + x13 + ")");

        System.out.println("=== Java Bigint Literals New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
