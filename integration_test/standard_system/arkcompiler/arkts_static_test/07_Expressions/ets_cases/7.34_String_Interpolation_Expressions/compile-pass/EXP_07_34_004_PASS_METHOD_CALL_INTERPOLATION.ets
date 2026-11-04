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
 * @id EXP_07_34_004_PASS_METHOD_CALL_INTERPOLATION
 * @expect compile-pass
 * @section 7.34
 * @design 验证方法/函数调用作为嵌入表达式的编译通过：函数返回值、方法返回值自动转换为字符串
 * @note 正向用例：嵌入表达式可以是函数调用、方法调用等任意表达式，结果自动转换为 string
 */

function getGreeting(): string {
  return 'Hello';
}

function doubleIt(x: int): int {
  return x * 2;
}

class Helper {
  getLabel(): string {
    return 'result';
  }
}

function main(): void {
  // 函数调用插值
  let r1: string = `${getGreeting()}, world`;

  // 函数调用返回 int 插值
  let r2: string = `double of 5 is ${doubleIt(5)}`;

  // 方法调用插值
  let h: Helper = new Helper();
  let r3: string = `label = ${h.getLabel()
}`;

  // 链式调用
  let r4: string = `length = ${'hello'.length}`;

  console.log('verified');
}
