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
// Java Runtime Test - 对应 2.9.3 Floating-Point Literals 补充用例
// 测试重点：负浮点数、零浮点表示、科学计数法变体、特殊值运算、精度差异
// 覆盖 5 个新增 runtime 测试场景 (023-027)

public class FloatingPointNewRuntimeTest {
    public static void main(String[] args) {
        int totalAssertions = 0;

        System.out.println("[Java] Floating-Point Literals New Runtime Test");

        // 023: 负浮点数
        double x1 = -3.14;
        assert x1 == -3.14 : "023: -3.14 failed";
        totalAssertions++;
        System.out.println("[Java] 023 -3.14: PASSED (" + x1 + ")");

        double x2 = -0.5;
        assert x2 == -0.5 : "023: -0.5 failed";
        totalAssertions++;
        System.out.println("[Java] 023 -0.5: PASSED (" + x2 + ")");

        double x3 = -.5;
        assert x3 == -0.5 : "023: -.5 failed";
        totalAssertions++;
        System.out.println("[Java] 023 -.5: PASSED (" + x3 + ")");

        double x4 = -1e10;
        assert x4 == -10000000000.0 : "023: -1e10 failed";
        totalAssertions++;
        System.out.println("[Java] 023 -1e10: PASSED (" + x4 + ")");

        // 024: 零浮点表示
        double x5 = 0.0;
        double x6 = .0;
        double x7 = 0e0;

        assert x5 == 0.0 : "024: 0.0 failed";
        totalAssertions++;
        System.out.println("[Java] 024 0.0: PASSED (" + x5 + ")");

        assert x6 == 0.0 : "024: .0 failed";
        totalAssertions++;
        System.out.println("[Java] 024 .0: PASSED (" + x6 + ")");

        assert x7 == 0.0 : "024: 0e0 failed";
        totalAssertions++;
        System.out.println("[Java] 024 0e0: PASSED (" + x7 + ")");

        // 025: 科学计数法变体
        double x8 = 1.5E10;
        assert x8 == 15000000000.0 : "025: 1.5E10 failed";
        totalAssertions++;
        System.out.println("[Java] 025 1.5E10: PASSED (" + x8 + ")");

        double x9 = 1e-5;
        assert x9 == 0.00001 : "025: 1e-5 failed";
        totalAssertions++;
        System.out.println("[Java] 025 1e-5: PASSED (" + x9 + ")");

        double x10 = 1.5e+10;
        assert x10 == 15000000000.0 : "025: 1.5e+10 failed";
        totalAssertions++;
        System.out.println("[Java] 025 1.5e+10: PASSED (" + x10 + ")");

        // 026: 特殊值运算
        double nan = 0.0 / 0.0;
        double x11 = nan + 1;
        assert Double.isNaN(x11) : "026: NaN + 1 should be NaN";
        totalAssertions++;
        System.out.println("[Java] 026 NaN + 1: PASSED (" + x11 + ")");

        double inf = 1.0 / 0.0;
        double x12 = inf + 1;
        assert Double.isInfinite(x12) : "026: Infinity + 1 should be Infinity";
        totalAssertions++;
        System.out.println("[Java] 026 Infinity + 1: PASSED (" + x12 + ")");

        assert nan != nan : "026: NaN should not equal itself";
        totalAssertions++;
        System.out.println("[Java] 026 NaN != NaN: PASSED");

        assert inf == inf : "026: Infinity should equal itself";
        totalAssertions++;
        System.out.println("[Java] 026 Infinity == Infinity: PASSED");

        // 027: float vs double 精度
        float x13 = 3.141592653589793f;
        assert x13 > 3.141592f && x13 < 3.141594f : "027: float precision failed";
        totalAssertions++;
        System.out.println("[Java] 027 float precision: PASSED (" + x13 + ")");

        double x14 = 3.141592653589793;
        assert x14 > 3.141592653589792 && x14 < 3.141592653589794 : "027: double precision failed";
        totalAssertions++;
        System.out.println("[Java] 027 double precision: PASSED (" + x14 + ")");

        System.out.println("=== Java Floating-Point Literals New Runtime Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
