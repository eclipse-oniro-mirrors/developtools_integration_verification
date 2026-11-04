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
// Java Runtime Test - 对应 2.7 Keywords 补充用例
// 测试重点：of 关键字、do-while、switch-case、throw
// 覆盖 4 个新增 runtime 测试场景 (097, 099-101)

public class KeywordsNewRuntimeTest {
    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Keywords New Runtime Test");

        // 097: of 关键字 - for-each 循环
        int[] arr = {1, 2, 3, 4, 5};
        int sum1 = 0;
        for (int item : arr) {
            sum1 = sum1 + item;
        }
        assert sum1 == 15 : "097: for-of failed";
        totalAssertions++;
        System.out.println("[Java] 097 for-of: PASSED (" + sum1 + ")");

        // 099: do-while 关键字
        int i = 0;
        int sum2 = 0;
        do {
            sum2 = sum2 + i;
            i++;
        } while (i < 5);
        assert sum2 == 10 : "099: do-while failed";
        totalAssertions++;
        System.out.println("[Java] 099 do-while: PASSED (" + sum2 + ")");

        // 100: switch-case 关键字
        int x = 1;
        int result = 0;
        switch (x) {
            case 1:
                result = 10;
                break;
            case 2:
                result = 20;
                break;
            default:
                result = 0;
                break;
        }
        assert result == 10 : "100: switch-case failed";
        totalAssertions++;
        System.out.println("[Java] 100 switch-case: PASSED (" + result + ")");

        // 101: throw 关键字
        boolean caught = false;
        try {
            throw new Exception("test error");
        } catch (Exception e) {
            caught = true;
        }
        assert caught == true : "101: throw failed";
        totalAssertions++;
        System.out.println("[Java] 101 throw: PASSED (" + caught + ")");

        System.out.println("=== Java Keywords New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
