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
 * @id SEM_15_10_01_004_PASS_UNAMBIGUOUS_OVERLOAD
 * @expect compile-pass
 * @section 15.10.1
 * @design 验证重载解析 — 编译器在可确定最佳匹配时允许重载
 * @note 编译器可根据参数类型确定最佳匹配（int,int -> foo(int,int)），不报错
 */
function foo(a: int, b: int): string { return 'int_int'; }
function foo(a: int, b: string): string { return 'int_str'; }
function main(): void {
    let r: string = foo(1, 2);
    console.log(r);
}
