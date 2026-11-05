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
// Java Runtime Test - 对应 LEX_02_02 词法输入元素
// 测试因子checklist: 局部/全局书写、参数上下文、控制流中的空白和注释
// 覆盖 11 个 runtime 测试场景 (019-029)

public class LexicalInputTest {
    // 全局变量
    static int 全局值 = 100;

    // 019: 空白符不影响算术运算结果
    static int whitespaceArith() {
        int a = 10 + 20;  // 空格分隔
        int b = 30	+ 40;  // Tab 分隔
        int c = 50 +      // 换行分隔
                60;
        return a + b + c;
    }

    // 020: 注释不影响变量值
    static int commentNoEffect() {
        int x = 10; // 这是注释
        int y = 20; /* 这是多行注释 */
        return x + y;
    }

    // 021: 多行表达式结果
    static int multiLineExpr() {
        int result = 10 +
                     20 +
                     30;
        return result;
    }

    // 022: 连续空行不影响语句
    static int consecutiveEmptyLines() {
        int a = 10;

        int b = 20;


        int c = 30;


        return a + b + c;
    }

    // 023: 表达式内注释
    static int commentInsideExpr() {
        int result = 10 + /* 中间注释 */ 20;
        return result;
    }

    // 024: 换行分隔多条语句
    static int lineSepMultiStmt() {
        int a = 10;
        int b = 20;
        int c = 30;
        return a + b + c;
    }

    // 025: Token 边界识别
    static int tokenBoundary() {
        let x = 10;  // 关键字与标识符分隔
        let y = 20;
        return x + y;
    }

    // 026: 局部/全局作用域
    static int 局部计算() {
        int 局部值 = 200;
        return 局部值 + 全局值; // 行末中文注释
    }

    // 027: 参数上下文
    static int 参数计算(int 输入) {
        return 输入 + 全局值;
    }

    // 028: Unicode 在注释中
    static int unicodeInComments() {
        int 值 = 10; // 中文注释
        值 += 20; // Japanese: 日本語コメント
        值 += 30; // Korean: 한국어 주석
        return 值;
    }

    // 029: 控制流中的空白和注释
    static int controlFlowWhitespace() {
        int 总和 = 0;
        for (int i = 0; i < 5; i++ /* 递增注释 */) {
            总和 += i;
        }

        int 计数 = 0;
        while (计数 < 3 /* while条件注释 */) {
            总和 += 计数;
            计数++;
        }

        if (总和 > 10 /* 条件注释 */) {
            总和 *= 2;
        }

        return 总和;
    }

    static class 计算类 {
        int 增量 = 1;
        int 计算(int 输入) {
            return 输入 + 增量 + 全局值;
        }
    }

    public static void main(String[] args) {
        int totalAssertions = 0;

        // 019: 空白符不影响算术运算结果
        int r19 = whitespaceArith();
        assert r19 == 210 : "019: whitespace arith failed, got " + r19;
        totalAssertions++;
        System.out.println("[Java] 019 Whitespace arithmetic: PASSED (" + r19 + ")");

        // 020: 注释不影响变量值
        int r20 = commentNoEffect();
        assert r20 == 30 : "020: comment no effect failed, got " + r20;
        totalAssertions++;
        System.out.println("[Java] 020 Comment no effect: PASSED (" + r20 + ")");

        // 021: 多行表达式结果
        int r21 = multiLineExpr();
        assert r21 == 60 : "021: multi-line expr failed, got " + r21;
        totalAssertions++;
        System.out.println("[Java] 021 Multi-line expression: PASSED (" + r21 + ")");

        // 022: 连续空行不影响语句
        int r22 = consecutiveEmptyLines();
        assert r22 == 60 : "022: consecutive empty lines failed, got " + r22;
        totalAssertions++;
        System.out.println("[Java] 022 Consecutive empty lines: PASSED (" + r22 + ")");

        // 023: 表达式内注释
        int r23 = commentInsideExpr();
        assert r23 == 30 : "023: comment inside expr failed, got " + r23;
        totalAssertions++;
        System.out.println("[Java] 023 Comment inside expression: PASSED (" + r23 + ")");

        // 024: 换行分隔多条语句
        int r24 = lineSepMultiStmt();
        assert r24 == 60 : "024: line sep multi stmt failed, got " + r24;
        totalAssertions++;
        System.out.println("[Java] 024 Line separator multi-stmt: PASSED (" + r24 + ")");

        // 025: Token 边界识别
        int r25 = tokenBoundary();
        assert r25 == 30 : "025: token boundary failed, got " + r25;
        totalAssertions++;
        System.out.println("[Java] 025 Token boundary: PASSED (" + r25 + ")");

        // 026: 局部/全局作用域
        int r26 = 局部计算();
        assert r26 == 300 : "026: scope variations failed, got " + r26;
        totalAssertions++;
        System.out.println("[Java] 026 Scope variations: PASSED (" + r26 + ")");

        // 027: 参数上下文
        int r27 = 参数计算(50);
        assert r27 == 150 : "027: param context failed, got " + r27;
        totalAssertions++;
        System.out.println("[Java] 027 Parameter context: PASSED (" + r27 + ")");

        // 028: Unicode 在注释中
        int r28 = unicodeInComments();
        assert r28 == 60 : "028: unicode in comments failed, got " + r28;
        totalAssertions++;
        System.out.println("[Java] 028 Unicode in comments: PASSED (" + r28 + ")");

        // 029: 控制流中的空白和注释
        int r29 = controlFlowWhitespace();
        assert r29 == 26 : "029: control flow whitespace failed, got " + r29;
        totalAssertions++;
        System.out.println("[Java] 029 Control flow whitespace: PASSED (" + r29 + ")");

        System.out.println("=== Java Lexical Input Test PASSED ===");
        System.out.println("Total assertions passed: " + totalAssertions);
    }
}
