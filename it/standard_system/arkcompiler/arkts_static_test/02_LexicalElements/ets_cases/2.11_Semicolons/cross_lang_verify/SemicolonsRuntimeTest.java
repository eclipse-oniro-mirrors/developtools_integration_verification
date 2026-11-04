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
// Java Runtime Test - 对应 2.11 Semicolons
// 测试重点：行分隔符终止、分号分隔运行时行为
// 覆盖 2 个 runtime 测试场景 (010-011)

public class SemicolonsRuntimeTest {
    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Semicolons Runtime Test");
        System.out.println("");

        // 010: 行分隔符终止运行时行为
        int x1 = 1;
        int x2 = 2;
        int x3 = x1 + x2;
        assert x3 == 3 : "010: line terminator failed";
        totalAssertions++;
        System.out.println("[Java] 010 line terminator: PASSED (" + x3 + ")");

        // 011: 分号分隔运行时行为
        int x4 = 1; int x5 = 2; int x6 = x4 + x5;
        assert x6 == 3 : "011: semicolon failed";
        totalAssertions++;
        System.out.println("[Java] 011 semicolon: PASSED (" + x6 + ")");

        System.out.println("=== Java Semicolons Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
