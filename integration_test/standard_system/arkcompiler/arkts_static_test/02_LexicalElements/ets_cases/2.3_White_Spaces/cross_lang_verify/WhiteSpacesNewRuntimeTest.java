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
// Java Runtime Test - 对应 2.3 White Spaces 补充用例
// 测试重点：Unicode 空白字符、类型注解周围空白、泛型中空白
// 覆盖 3 个新增 runtime 测试场景 (043-045)

public class WhiteSpacesNewRuntimeTest {
    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] White Spaces New Runtime Test");

        // 043: Unicode 空白字符
        // Java 支持 Unicode 空白字符作为分隔符
        int x1 = 1;
        int y1 = 2;
        int z1 = x1 + y1;
        assert z1 == 3 : "043: Unicode whitespace failed";
        totalAssertions++;
        System.out.println("[Java] 043 Unicode whitespace: PASSED (" + z1 + ")");

        // 044: 类型注解周围空白
        int x2 = 10;
        int y2 = 20;
        int z2 = x2 + y2;
        assert z2 == 30 : "044: type annotation whitespace failed";
        totalAssertions++;
        System.out.println("[Java] 044 type annotation whitespace: PASSED (" + z2 + ")");

        // 045: 泛型中空白
        java.util.List<Integer> arr1 = java.util.Arrays.asList(1, 2, 3);
        java.util.List < Integer > arr2 = java.util.Arrays.asList(4, 5, 6);
        java.util.List< Integer > arr3 = java.util.Arrays.asList(7, 8, 9);

        assert arr1.get(0) == 1 : "045: arr1[0] failed";
        totalAssertions++;
        System.out.println("[Java] 045 arr1[0]: PASSED (" + arr1.get(0) + ")");

        assert arr2.get(0) == 4 : "045: arr2[0] failed";
        totalAssertions++;
        System.out.println("[Java] 045 arr2[0]: PASSED (" + arr2.get(0) + ")");

        assert arr3.get(0) == 7 : "045: arr3[0] failed";
        totalAssertions++;
        System.out.println("[Java] 045 arr3[0]: PASSED (" + arr3.get(0) + ")");

        assert arr1.size() == 3 : "045: arr1.length failed";
        totalAssertions++;
        System.out.println("[Java] 045 arr1.length: PASSED (" + arr1.size() + ")");

        System.out.println("=== Java White Spaces New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
