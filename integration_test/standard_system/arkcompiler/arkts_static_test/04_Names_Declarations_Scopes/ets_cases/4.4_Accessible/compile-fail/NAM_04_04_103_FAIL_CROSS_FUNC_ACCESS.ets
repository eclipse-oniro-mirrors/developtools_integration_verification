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
 * @id NAM_04_04_103_FAIL_CROSS_FUNC_ACCESS
 * @expect compile-fail
 * @section 4.4
 * @design 跨函数作用域访问
 * @note 反向用例：验证一个函数引用另一个函数内局部变量导致编译错误（函数隔离）
 */
function first(): void {
    let secret: number = 99;
}
function second(): void {
    let leaked: number = secret;
}
