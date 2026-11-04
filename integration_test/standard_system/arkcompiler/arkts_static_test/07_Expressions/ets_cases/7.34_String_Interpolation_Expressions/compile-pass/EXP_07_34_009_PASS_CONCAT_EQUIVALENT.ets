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
 * @id EXP_07_34_009_PASS_CONCAT_EQUIVALENT
 * @expect compile-pass
 * @section 7.34
 * @design 验证字符串插值与字符串拼接运算符的等价性：插值表达式可以用 + 运算符重写，结果类型均为 string
 * @note 正向用例：Spec 第 3-5 行说明插值可用 + 重写，比较两种语法编译通过
 */
function main(): void {
  let a: int = 2;
  let b: int = 2;

  // 插值版本（spec 示例）
  let interp: string = `The result of ${a} * ${b} is ${a * b}`;

  // 拼接等价版本（spec 示例）
  let concat: string = 'The result of ' + a + ' * ' + b + ' is ' + a * b;

  // 其他插值等价测试
  let name: string = 'world';
  let interp2: string = `hello ${name}`;
  let concat2: string = 'hello ' + name;

  // 数值拼接等价
  let interp3: string = `value = ${a + b}`;
  let concat3: string = 'value = ' + (a + b);

  console.log('verified');
}
