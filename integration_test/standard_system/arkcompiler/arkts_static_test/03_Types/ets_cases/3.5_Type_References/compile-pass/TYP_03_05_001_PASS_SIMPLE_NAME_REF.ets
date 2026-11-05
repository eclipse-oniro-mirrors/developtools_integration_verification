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
 * @id TYP_03_05_001_PASS_SIMPLE_NAME_REF
 * @expect compile-pass
 * @section 3.5
 * @design 通过简单类型名做类型引用
 * @note 正向用例：simple name 类型引用
 */
class MyClass5 {
  v: int = 0
}

interface MyIface5 {
  do5(): void
}

enum MyEnum5 { X, Y }

function testSimpleNameRef(): void {
  // 预定义类型简单名
  let n: int = 1
  let s: string = "x"
  let b: boolean = true

  // 用户类型简单名
  let c: MyClass5 = new MyClass5()
  let e: MyEnum5 = MyEnum5.X
}