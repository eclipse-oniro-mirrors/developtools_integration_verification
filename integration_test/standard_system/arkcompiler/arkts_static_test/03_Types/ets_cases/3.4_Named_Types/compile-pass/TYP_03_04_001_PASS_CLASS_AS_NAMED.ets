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
 * @id TYP_03_04_001_PASS_CLASS_AS_NAMED
 * @expect compile-pass
 * @section 3.4
 * @design 类声明引入命名类型，可作类型注解
 * @note 正向用例：class declaration 引入 named type
 */
class NamedClass {
  field: int = 0
  method(): string { return "named" }
}

function testClassNamed(): void {
  let c: NamedClass = new NamedClass()
  let s: string = c.method()
}