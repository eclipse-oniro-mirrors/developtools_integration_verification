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
 * @id EXP_07_13_03_008_FAIL_CASE1_INVALID_LITERAL_READ
 * @expect compile-fail
 * @section 7.13.3
 * @design Case 1: 验证读取字面量联合中不存在的键产生编译时错误
 * @note 反向用例：x['key4'] 不在 Keys = 'key1'|'key2'|'key3' 中，编译时错误
 */
type Keys = 'key1' | 'key2' | 'key3';

function main(): void {
  let x: Record<Keys, number> = {
    'key1': 1,
    'key2': 2,
    'key3': 4
  };
  let y: number = x['key4'];
}
