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
 * @id TYP_03_18_01_001_PASS_FUNCTION_TYPE_ASSIGN
 * @expect compile-pass
 * @section 3.18.1
 * @design 函数/方法/lambda 赋给 Function 类型变量
 * @note 正向用例：验证 Function 类型接受各种函数值
 */
function foo(): void {}

class MyClass {
  static sm(): void {}
  m(): void {}
}

function testFunctionTypeAssign(): void {
  // 函数赋给 Function
  let f1: Function = foo

  // 静态方法赋给 Function
  let f2: Function = MyClass.sm

  // 实例方法赋给 Function
  let obj: MyClass = new MyClass()
  let f3: Function = obj.m

  // lambda 赋给 Function
  let f4: Function = (): void => {}
  let f5: Function = (x: int): int => { return x }
}