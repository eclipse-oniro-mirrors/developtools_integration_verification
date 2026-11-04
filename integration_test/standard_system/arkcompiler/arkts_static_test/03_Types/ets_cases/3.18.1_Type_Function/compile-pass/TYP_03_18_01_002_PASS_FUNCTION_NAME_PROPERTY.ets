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
 * @id TYP_03_18_01_002_PASS_FUNCTION_NAME_PROPERTY
 * @expect compile-pass
 * @section 3.18.1
 * @design Function.name 属性：函数名、方法名、lambda 变量名
 * @note 正向用例：验证 Function.name 属性编译通过
 */
function namedFunc(): void {}

class A {
  static sm(): void {}
  m(): void {}
}

function testFunctionNameProperty(): void {
  let f1: Function = namedFunc
  let n1: string = f1.name

  let f2: Function = A.sm
  let n2: string = f2.name

  let a: A = new A()
  let f3: Function = a.m
  let n3: string = f3.name

  let x: Function = (): void => {}
  let n4: string = x.name
}