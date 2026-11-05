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
 * @id EXP_07_32_01_004_PASS_RECORD_INDEX_ASSIGN
 * @expect compile-pass
 * @section 7.32.1
 * @design 验证记录索引表达式作为左值 rec[key] = value 的编译通过：string literal 作为 key
 * @note 正向用例：验证 Record<K, V> 类型中 rec[key] = rhs 形式的编译通过。所有 type alias 定义在模块级别（不允许在函数内定义）
 */

type Keys = 'x' | 'y' | 'z';
type StrKeys = 'name' | 'desc';
type NumKeys = 'k1' | 'k2';

function main(): void {
  let coord: Record<Keys, int> = { 'x': 0, 'y': 0, 'z': 0 };

  // 字面量 key 赋值
  coord['x'] = 10;
  coord['y'] = 20;
  coord['z'] = 30;

  // 多次赋值
  coord['x'] = coord['x'] + 1;

  // 字符串 key 记录
  let info: Record<StrKeys, string> = { 'name': "', 'desc': '" };
  info['name'] = 'test';
  info['desc'] = 'description';

  // 数值 key 记录（需用 string literal union 表示）
  let nums: Record<NumKeys, double> = { 'k1': 0.0, 'k2': 0.0 };
  nums['k1'] = 1.5;
  nums['k2'] = 2.5;

  console.log('verified');
}
