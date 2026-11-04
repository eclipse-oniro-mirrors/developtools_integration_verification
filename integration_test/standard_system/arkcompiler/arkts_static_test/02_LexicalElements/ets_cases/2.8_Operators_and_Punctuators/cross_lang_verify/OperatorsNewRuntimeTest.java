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
// Java Runtime Test - 对应 2.8 Operators and Punctuators 补充用例
// 测试重点：指数运算符、箭头函数、运算符优先级、更多复合赋值
// 覆盖 4 个新增 runtime 测试场景 (036-039)

public class OperatorsNewRuntimeTest {
    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Operators New Runtime Test");

        // 036: 指数运算符
        int x1 = (int) Math.pow(2, 3);
        assert x1 == 8 : "036: 2 ** 3 failed";
        totalAssertions++;
        System.out.println("[Java] 036 2 ** 3: PASSED (" + x1 + ")");

        int x2 = (int) Math.pow(10, 2);
        assert x2 == 100 : "036: 10 ** 2 failed";
        totalAssertions++;
        System.out.println("[Java] 036 10 ** 2: PASSED (" + x2 + ")");

        int x3 = (int) Math.pow(2, 10);
        assert x3 == 1024 : "036: 2 ** 10 failed";
        totalAssertions++;
        System.out.println("[Java] 036 2 ** 10: PASSED (" + x3 + ")");

        // 037: 箭头函数（Java 使用 lambda）
        java.util.function.BiFunction<Integer, Integer, Integer> add = (a, b) -> a + b;
        int result1 = add.apply(1, 2);
        assert result1 == 3 : "037: add failed";
        totalAssertions++;
        System.out.println("[Java] 037 add: PASSED (" + result1 + ")");

        java.util.function.Function<Integer, Integer> square = x -> x * x;
        int result2 = square.apply(5);
        assert result2 == 25 : "037: square failed";
        totalAssertions++;
        System.out.println("[Java] 037 square: PASSED (" + result2 + ")");

        // 038: 运算符优先级
        int x4 = 2 + 3 * 4;
        assert x4 == 14 : "038: 2 + 3 * 4 failed";
        totalAssertions++;
        System.out.println("[Java] 038 2 + 3 * 4: PASSED (" + x4 + ")");

        int x5 = (2 + 3) * 4;
        assert x5 == 20 : "038: (2 + 3) * 4 failed";
        totalAssertions++;
        System.out.println("[Java] 038 (2 + 3) * 4: PASSED (" + x5 + ")");

        boolean x6 = true || false && false;
        assert x6 == true : "038: true || false && false failed";
        totalAssertions++;
        System.out.println("[Java] 038 true || false && false: PASSED (" + x6 + ")");

        // 039: 更多复合赋值
        int x7 = 2;
        x7 = (int) Math.pow(x7, 3);
        assert x7 == 8 : "039: **= failed";
        totalAssertions++;
        System.out.println("[Java] 039 **=: PASSED (" + x7 + ")");

        int x8 = 1;
        x8 <<= 2;
        assert x8 == 4 : "039: <<= failed";
        totalAssertions++;
        System.out.println("[Java] 039 <<=: PASSED (" + x8 + ")");

        int x9 = 8;
        x9 >>= 1;
        assert x9 == 4 : "039: >>= failed";
        totalAssertions++;
        System.out.println("[Java] 039 >>=: PASSED (" + x9 + ")");

        System.out.println("=== Java Operators New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
