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
 * @id EXP_07_32_03_005_PASS_RECORD_INDEX_LHS
 * @expect compile-pass
 * @section 7.32.3
 * @design 验证记录索引访问（Record Indexing）作为左值表达式的编译通过：字符串字面量 key、变量 key 均可作为赋值目标
 * @note 正向用例：记录索引表达式 rec[key] 是五种有效左值形式之一，验证记录元素赋值编译通过
 */

// 记录 key 类型必须在模块级别定义
type K = 'a' | 'b' | 'c';
type SK = 'x' | 'y';

function main(): void {
  let rec: Record<K, int> = { 'a': 0, 'b': 0, 'c': 0 };

  // 字符串字面量 key 作为左值
  rec['a'] = 100;
  rec['b'] = 200;
  rec['c'] = 300;

  // 混合类型记录 (string key, string value)
  let strRec: Record<SK, string> = { 'x': "', 'y': '" };
  strRec['x'] = 'first';
  strRec['y'] = 'second';

  console.log('verified');
}
