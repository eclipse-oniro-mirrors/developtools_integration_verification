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
 * @id STMT_08_01_006_FAIL_break_outside_loop
 * @expect compile-fail
 * @section 8.1
 * @design 验证 break 语句在循环或switch外部使用导致编译错误：break 的异常完成语义要求在循环/switch作用域内
 * @note break 必须在 for/while/do-while/switch 语句体内使用，否则编译错误
 */
function testBreakOutsideLoop(): void {
    let x: int = 0;
    if (x > 0) {
        break;
    }
}
