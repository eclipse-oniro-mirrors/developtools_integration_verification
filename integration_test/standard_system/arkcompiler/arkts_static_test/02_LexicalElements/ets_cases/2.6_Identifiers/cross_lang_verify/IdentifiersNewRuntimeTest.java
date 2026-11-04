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
// Java Runtime Test - 对应 2.6 Identifiers 补充用例
// 测试重点：长标识符、大小写敏感、作用域
// 覆盖 3 个新增 runtime 测试场景 (048-050)

public class IdentifiersNewRuntimeTest {
    static int globalVar = 100;

    static int testScope() {
        int localVar = 200;
        if (true) {
            int blockVar = 300;
            return globalVar + localVar + blockVar;
        }
        return 0;
    }

    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Identifiers New Runtime Test");

        // 048: 长标识符
        int veryLongIdentifierNameThatIsUsedForTestingPurposesOnly = 1;
        assert veryLongIdentifierNameThatIsUsedForTestingPurposesOnly == 1 : "048: long identifier failed";
        totalAssertions++;
        System.out.println("[Java] 048 long identifier: PASSED (" + veryLongIdentifierNameThatIsUsedForTestingPurposesOnly + ")");

        int a123456789012345678901234567890 = 2;
        assert a123456789012345678901234567890 == 2 : "048: numeric suffix identifier failed";
        totalAssertions++;
        System.out.println("[Java] 048 numeric suffix identifier: PASSED (" + a123456789012345678901234567890 + ")");

        // 049: 大小写敏感
        int myVar = 1;
        int MyVar = 2;
        int MYVAR = 3;
        int myvar = 4;

        assert myVar == 1 : "049: myVar failed";
        totalAssertions++;
        System.out.println("[Java] 049 myVar: PASSED (" + myVar + ")");

        assert MyVar == 2 : "049: MyVar failed";
        totalAssertions++;
        System.out.println("[Java] 049 MyVar: PASSED (" + MyVar + ")");

        assert MYVAR == 3 : "049: MYVAR failed";
        totalAssertions++;
        System.out.println("[Java] 049 MYVAR: PASSED (" + MYVAR + ")");

        assert myvar == 4 : "049: myvar failed";
        totalAssertions++;
        System.out.println("[Java] 049 myvar: PASSED (" + myvar + ")");

        int sum = myVar + MyVar + MYVAR + myvar;
        assert sum == 10 : "049: sum failed";
        totalAssertions++;
        System.out.println("[Java] 049 sum: PASSED (" + sum + ")");

        // 050: 作用域
        assert globalVar == 100 : "050: globalVar failed";
        totalAssertions++;
        System.out.println("[Java] 050 globalVar: PASSED (" + globalVar + ")");

        int result = testScope();
        assert result == 600 : "050: testScope failed";
        totalAssertions++;
        System.out.println("[Java] 050 testScope: PASSED (" + result + ")");

        System.out.println("=== Java Identifiers New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
