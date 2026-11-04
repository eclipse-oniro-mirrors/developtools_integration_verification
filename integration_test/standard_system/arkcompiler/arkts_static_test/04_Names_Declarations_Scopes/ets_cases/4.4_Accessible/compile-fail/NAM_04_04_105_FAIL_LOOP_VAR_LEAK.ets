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
 * @id NAM_04_04_105_FAIL_LOOP_VAR_LEAK
 * @expect compile-fail
 * @section 4.4
 * @design 循环块作用域泄漏
 * @note 反向用例：验证for循环块内声明的变量在循环外不可访问（循环体作用域隔离）
 */
function sum(n: number): void {
    for (let i: number = 0; i < n; i++) {
        let temp: number = i * 2;
    }
    let leaked: number = temp;
}
