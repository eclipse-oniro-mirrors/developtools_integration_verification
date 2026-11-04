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
 * @id SEM_15_10_01_100_FAIL_ERASURE_AMBIGUOUS
 * @expect compile-fail
 * @section 15.10.1
 * @design 验证重载解析 — 类型擦除后签名不可区分时报错
 * @note 反向用例：泛型类型擦除后重载不可区分应拒绝
 */
function foo(x: int[]): string { return 'int_arr'; }
function foo(x: string[]): string { return 'str_arr'; }
function main(): void {
    let r: string = foo([1, 2]);
}
