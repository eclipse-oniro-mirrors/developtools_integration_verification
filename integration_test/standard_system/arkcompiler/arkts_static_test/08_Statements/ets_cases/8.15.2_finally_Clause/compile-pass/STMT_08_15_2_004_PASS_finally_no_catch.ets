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
/**
 * @id STMT_08_15_2_004_PASS_finally_no_catch
 * @expect compile-pass
 * @section 8.15.2
 * @design 测试没有catch块、仅有try-finally的结构。try块正常执行后，finally块执行。验证try-finally（无catch）语法在编译器中正确识别。
 * @note 正向测试：不含catch的try-finally结构，验证简化的异常处理框架编译通过
 */
function testFinallyNoCatch(): void {
    let list: number[] = [10, 20, 30];
    let idx: number = 0;
    try {
        idx = list[0];
    } finally {
        idx = idx + 1;
    }
    if (idx != 11) {
        console.log("FAIL: idx should be 11 but got " + idx);
    }
}
