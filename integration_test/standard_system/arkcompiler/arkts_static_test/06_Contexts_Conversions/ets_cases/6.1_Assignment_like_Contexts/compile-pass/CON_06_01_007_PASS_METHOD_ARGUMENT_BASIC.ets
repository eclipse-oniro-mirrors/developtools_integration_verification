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
 * @id CON_06_01_007_PASS_METHOD_ARGUMENT_BASIC
 * @expect compile-pass
 * @section 6.1
 * @design Call context: 方法调用实参类型与形参类型完全匹配
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Calculator {
  add(a: int, b: int): int {
    return a + b
  }

  concat(s1: string, s2: string): string {
    return s1 + s2
  }
}

function testMethodArgumentBasic(): void {
  let calc: Calculator = new Calculator()
  let sum: int = calc.add(10, 20)
  let result: string = calc.concat('hello', 'world')
}
