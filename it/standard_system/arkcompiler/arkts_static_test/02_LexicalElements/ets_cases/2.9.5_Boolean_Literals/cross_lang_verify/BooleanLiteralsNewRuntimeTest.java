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
// Java Runtime Test - 对应 2.9.5 Boolean Literals 补充用例
// 测试重点：布尔默认值、布尔在循环中、布尔函数参数、布尔类型守卫
// 覆盖 4 个新增 runtime 测试场景 (020-023)

public class BooleanLiteralsNewRuntimeTest {
    static boolean testBool(boolean x) {
        return x;
    }

    static boolean and(boolean a, boolean b) {
        return a && b;
    }

    static boolean or(boolean a, boolean b) {
        return a || b;
    }

    static boolean not(boolean x) {
        return !x;
    }

    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Boolean Literals New Runtime Test");

        // 020: 布尔默认值
        boolean x1 = false;
        assert x1 == false : "020: false failed";
        totalAssertions++;
        System.out.println("[Java] 020 false: PASSED (" + x1 + ")");

        boolean x2 = true;
        assert x2 == true : "020: true failed";
        totalAssertions++;
        System.out.println("[Java] 020 true: PASSED (" + x2 + ")");

        // 021: 布尔在循环中
        int i = 0;
        int sum1 = 0;
        while (i < 5) {
            sum1 = sum1 + i;
            i++;
        }
        assert sum1 == 10 : "021: while loop failed";
        totalAssertions++;
        System.out.println("[Java] 021 while loop: PASSED (" + sum1 + ")");

        int sum2 = 0;
        for (int j = 0; j < 5; j++) {
            sum2 = sum2 + j;
        }
        assert sum2 == 10 : "021: for loop failed";
        totalAssertions++;
        System.out.println("[Java] 021 for loop: PASSED (" + sum2 + ")");

        // 022: 布尔函数参数
        boolean result1 = testBool(true);
        assert result1 == true : "022: testBool(true) failed";
        totalAssertions++;
        System.out.println("[Java] 022 testBool(true): PASSED (" + result1 + ")");

        boolean result2 = and(true, false);
        assert result2 == false : "022: and(true, false) failed";
        totalAssertions++;
        System.out.println("[Java] 022 and(true, false): PASSED (" + result2 + ")");

        boolean result3 = or(true, false);
        assert result3 == true : "022: or(true, false) failed";
        totalAssertions++;
        System.out.println("[Java] 022 or(true, false): PASSED (" + result3 + ")");

        boolean result4 = not(true);
        assert result4 == false : "022: not(true) failed";
        totalAssertions++;
        System.out.println("[Java] 022 not(true): PASSED (" + result4 + ")");

        // 023: 布尔类型守卫
        boolean x3 = true;
        if (x3 != true) {
            throw new Error("023: boolean value failed");
        }
        totalAssertions++;
        System.out.println("[Java] 023 boolean value: PASSED (" + x3 + ")");

        boolean x4 = false;
        if (x4 != false) {
            throw new Error("023: false value failed");
        }
        totalAssertions++;
        System.out.println("[Java] 023 false value: PASSED (" + x4 + ")");

        System.out.println("=== Java Boolean Literals New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
