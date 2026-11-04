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
 * @id EXP_07_13_03_011_FAIL_CASE1_NUMERIC_NOT_IN_UNION
 * @expect compile-fail
 * @section 7.13.3
 * @design Case 1: 数值字面量联合 Key，索引值不在联合中时编译时错误
 * @note 反向用例：NKeys = 1|2|3，x[4] 不在联合中，编译时错误
 */
type NKeys = 1 | 2 | 3;

function main(): void {
  let x: Record<NKeys, string> = {
    1: 'one',
    2: 'two',
    3: 'three'
  };
  let s: string = x[4];
}
