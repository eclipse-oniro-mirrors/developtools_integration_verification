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
 * @id SEM_15_02_07_002_PASS_fixed_array_self_assign
 * @expect compile-pass
 * @section 15.2.7
 * @design FixedArray 自身赋值：相同类型的 FixedArray 可互相赋值
 * @note 正向用例：Fixedint[] 类型实例可赋值给同类型变量
 */
function main(): void {
    let a: Fixedint[] = new Fixedint[](3);
    a[0] = 1;
    console.log('verified');
}
