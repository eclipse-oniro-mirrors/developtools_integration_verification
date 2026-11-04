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
 * @id LEX_02_05_007_PASS_KEYWORD_TYPE_DECL
 * @expect compile-pass
 * @section 2.5
 * @design Keywords Token: class/interface/enum 类型声明关键字
 * @note 正向用例：类型声明关键字作为 Token
 */
class MyClass {
  field: int = 0
}

interface MyInterface {
  method(): void
}

enum MyEnum {
  A,
  B,
  C
}

function testKeywordTypeDecl(): void {
  let obj: MyClass = new MyClass()
  let e: MyEnum = MyEnum.A
}
