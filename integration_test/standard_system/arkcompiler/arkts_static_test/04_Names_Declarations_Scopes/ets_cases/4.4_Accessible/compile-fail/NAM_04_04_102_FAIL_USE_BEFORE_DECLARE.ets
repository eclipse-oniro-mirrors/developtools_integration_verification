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
 * @id NAM_04_04_102_FAIL_USE_BEFORE_DECLARE
 * @expect compile-fail
 * @section 4.4
 * @design 声明前引用变量
 * @note 反向用例：验证在函数体内声明前引用变量导致编译错误（声明顺序约束）
 */
function foo(): void {
    let x: number = y;
    let y: number = 1;
}
