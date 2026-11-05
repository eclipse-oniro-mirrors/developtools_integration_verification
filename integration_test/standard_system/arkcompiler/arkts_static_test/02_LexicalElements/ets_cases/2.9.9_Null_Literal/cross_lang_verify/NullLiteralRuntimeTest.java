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
// Java Runtime Test - 对应 2.9.9 Null Literal
// 测试重点：null 值、比较、类型检查
// 覆盖 3 个 runtime 测试场景 (006-008)

public class NullLiteralRuntimeTest {
    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Null Literal Runtime Test");
        System.out.println("");

        // 006: null 值验证
        Object x1 = null;
        assert x1 == null : "006: null failed";
        totalAssertions++;
        System.out.println("[Java] 006 null value: PASSED (" + x1 + ")");

        // T | null 类型
        Integer x2 = null;
        assert x2 == null : "006: Integer null failed";
        totalAssertions++;
        System.out.println("[Java] 006 Integer null: PASSED (" + x2 + ")");

        String x3 = null;
        assert x3 == null : "006: String null failed";
        totalAssertions++;
        System.out.println("[Java] 006 String null: PASSED (" + x3 + ")");

        // 007: null 比较验证
        Object x4 = null;
        Object x5 = null;
        assert x4 == x5 : "007: null equality failed";
        totalAssertions++;
        System.out.println("[Java] 007 null equality: PASSED");

        // null 与数字比较
        int x6 = 0;
        assert x4 != (Object) x6 : "007: null should not equal 0";
        totalAssertions++;
        System.out.println("[Java] 007 null != 0: PASSED");

        // null 与字符串比较
        String x7 = "null";
        assert !x7.equals(x4) : "007: null should not equal \"null\"";
        totalAssertions++;
        System.out.println("[Java] 007 null != \"null\": PASSED");

        // 008: null 类型检查
        Object x8 = null;
        assert x8 == null : "008: null check failed";
        totalAssertions++;
        System.out.println("[Java] 008 null check: PASSED");

        System.out.println("=== Java Null Literal Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
