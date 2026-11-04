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
 * @id STMT_08_10_011_FAIL_break_deep_nested_outside
 * @expect compile-fail
 * @section 8.10
 * @design 在深层嵌套的if/else块中使用break语句（不在任何循环或switch内） — 应产生编译错误
 * @note break outside loopStatement or switchStatement in deep nested blocks → compile-time error
 */
function testBreakDeepNestedOutside(): void {
    let x: int = 0;
    if (x >= 0) {
        if (x == 0) {
            let y: int = 1;
            if (y > 0) {
                break;
            }
        }
    }
}
