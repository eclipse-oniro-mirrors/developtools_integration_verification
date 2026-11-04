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
 * @id EXP_07_32_01_006_PASS_SPEC_EXAMPLES
 * @expect compile-pass
 * @section 7.32.1
 * @design 验证规范中 4 个示例全部编译通过（字段访问、数组索引、记录索引、简单赋值）
 * @note 正向用例：直接运行规范文档中的示例代码。包含 Case 1-4 全部四种 lhsExpression 形式。类型别名定义在模块级
 */

// 规范示例所需类型定义
type Keys = 'key1' | 'key2' | 'key3';

// Case 1: field access lhsExpression
class A { public f: double = 0.0}

function main(): void {
  // Case 1: 字段访问 e.f = value
  new A().f = 1;

  // Case 2: 数组索引 arr[idx] = value
  let b: double[] = [1.0, 1.0, 1.0];
  b[1] = 2.0;

  // Case 3: 记录索引 rec[key] = value
  let x: Record<Keys, number> = { 'key1': 1, 'key2': 2, 'key3': 3 };
  x['key2'] = 8;

  // None of {field access|array indexing|record indexing}: 简单变量赋值
  let c: double = 0.0;
  c = 1.0;
  c = c + 2.0;

  console.log('verified');
}
