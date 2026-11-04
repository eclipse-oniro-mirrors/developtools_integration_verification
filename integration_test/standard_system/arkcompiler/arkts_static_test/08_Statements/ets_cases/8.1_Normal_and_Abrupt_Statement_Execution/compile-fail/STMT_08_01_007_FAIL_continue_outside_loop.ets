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
 * @id STMT_08_01_007_FAIL_continue_outside_loop
 * @expect compile-fail
 * @section 8.1
 * @design 验证 continue 语句在循环外部使用导致编译错误：continue 的跳转语义要求在循环作用域内
 * @note continue 必须在 for/while/do-while 循环体内使用，否则编译错误
 */
function testContinueOutsideLoop(): void {
    let x: int = 0;
    if (x > 0) {
        continue;
    }
}
