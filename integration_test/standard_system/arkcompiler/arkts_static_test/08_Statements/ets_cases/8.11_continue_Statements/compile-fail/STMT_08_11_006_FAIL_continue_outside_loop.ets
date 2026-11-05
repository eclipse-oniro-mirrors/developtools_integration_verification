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
 * @id STMT_08_11_006_FAIL_continue_outside_loop
 * @expect compile-fail
 * @section 8.11
 * @design 验证continue语句在循环语句外部使用时产生编译时错误
 * @note continue without any enclosing loop should be compile-time error
 */
function testContinueOutsideLoop(): void {
    let x: number = 0;
    x++;
    // compile-time error: continue outside any loop statement
    continue;
}
