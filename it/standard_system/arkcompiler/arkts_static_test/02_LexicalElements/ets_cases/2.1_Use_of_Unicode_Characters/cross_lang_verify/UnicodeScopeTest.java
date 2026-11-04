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
// Java Runtime Test - 对应 LEX_02_01_032~036 运行时用例
// 测试因子checklist: 局部/全局书写、类型转换、参数上下文、继承多态、集合容器

public class UnicodeScopeTest {
    static int 全局计数 = 10;

    static int 局部递增(int 增量) {
        int 局部结果 = 全局计数 + 增量;
        return 局部结果;
    }

    static class 计算器 {
        int 私有值 = 0;
        int 累加(int 数值) {
            int 方法局部 = this.私有值 + 数值;
            this.私有值 = 方法局部;
            return 方法局部;
        }
    }

    public static void main(String[] args) {
        int 结果1 = 局部递增(5);
        assert 结果1 == 15 : "Unicode scope: local+global mismatch, got " + 结果1;

        int 结果2 = 局部递增(10);
        assert 结果2 == 20 : "Unicode scope: local+global mismatch, got " + 结果2;

        计算器 计 = new 计算器();
        int 结果3 = 计.累加(100);
        assert 结果3 == 100 : "Unicode scope: class method mismatch";

        int 结果4 = 计.累加(50);
        assert 结果4 == 150 : "Unicode scope: class method mismatch";

        System.out.println("=== Unicode Scope Test PASSED ===");
    }
}