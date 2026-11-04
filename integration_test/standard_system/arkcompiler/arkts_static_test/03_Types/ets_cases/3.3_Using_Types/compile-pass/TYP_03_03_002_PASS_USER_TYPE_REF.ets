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
 * @id TYP_03_03_002_PASS_USER_TYPE_REF
 * @expect compile-pass
 * @section 3.3
 * @design 通过类名/接口名/枚举名做类型引用
 * @note 正向用例：验证用户定义类型名做类型引用
 *       注：局部类必须移到顶层（TYP-006 已知设计问题）
 */
class MyPoint {
  x: int = 0
  y: int = 0
}

interface MyShape {
  area(): int
}

class Square implements MyShape {
  area(): int { return 16 }
}

enum MyEnum {
  A,
  B,
  C
}

function testUserTypeRef(): void {
  let p: MyPoint = new MyPoint()
  let e: MyEnum = MyEnum.A
  let s: MyShape = new Square()
}