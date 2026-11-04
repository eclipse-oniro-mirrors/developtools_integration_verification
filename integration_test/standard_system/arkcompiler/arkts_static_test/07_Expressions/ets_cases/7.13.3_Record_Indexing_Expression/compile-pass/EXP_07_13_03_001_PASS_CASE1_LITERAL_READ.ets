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
 * @id EXP_07_13_03_001_PASS_CASE1_LITERAL_READ
 * @expect compile-pass
 * @section 7.13.3
 * @design Case 1: Key 为字面量联合类型，索引必须是联合中的字面量。验证合法字面量读取编译通过
 * @note 正向用例：x['key1']、x['key2']、x['key3'] 其中 Keys = 'key1'|'key2'|'key3'，编译通过
 */
type Keys = 'key1' | 'key2' | 'key3';

function main(): void {
  let x: Record<Keys, number> = {
    'key1': 1,
    'key2': 2,
    'key3': 4
  };
  let a: number = x['key1'];
  let b: number = x['key2'];
  let c: number = x['key3'];
}
