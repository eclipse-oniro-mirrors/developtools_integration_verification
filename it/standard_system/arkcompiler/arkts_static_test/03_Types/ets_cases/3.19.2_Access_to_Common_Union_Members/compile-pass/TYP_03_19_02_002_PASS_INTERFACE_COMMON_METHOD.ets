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
 * @id TYP_03_19_02_002_PASS_INTERFACE_COMMON_METHOD
 * @expect compile-pass
 * @section 3.19.2
 * @design interface/class union 中公共同签名方法可调用
 * @note 正向用例：两个接口都含 area(): int
 */
interface Shape2A {
  area(): int
}
interface Shape2B {
  area(): int
}

class Square2 implements Shape2A {
  area(): int { return 16 }
}
class Circle2 implements Shape2B {
  area(): int { return 9 }
}

function testInterfaceCommon(x: Shape2A | Shape2B): int {
  return x.area()
}