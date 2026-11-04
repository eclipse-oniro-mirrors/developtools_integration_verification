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
 * @id EXP_07_13_03_010_FAIL_CASE1_VARIABLE_INDEX
 * @expect compile-fail
 * @section 7.13.3
 * @design Case 1: Key 为字面量联合类型时，索引必须是字面量，变量作为索引编译时错误
 * @note 反向用例：let k = 'key1'; x[k] 变量索引，编译时错误
 * ⚠️ SPEC 不一致：编译器允许变量作为 Case1 的索引（匹配到 string 类型的 Key），
 *     spec 规定字面量联合 Key 只能使用字面量索引
 */
type Keys = 'key1' | 'key2' | 'key3';

function main(): void {
  let x: Record<Keys, number> = {
    'key1': 1,
    'key2': 2,
    'key3': 4
  };
  let k: string = 'key1';
  let y: number = x[k];
}
