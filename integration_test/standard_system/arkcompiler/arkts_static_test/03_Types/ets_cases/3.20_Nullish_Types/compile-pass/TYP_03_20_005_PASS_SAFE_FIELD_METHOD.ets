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
 * @id TYP_03_20_005_PASS_SAFE_FIELD_METHOD
 * @expect compile-pass
 * @section 3.20
 * @design safe field access 和 safe method call
 * @note 正向用例：obj?.field / obj?.method()
 */
class Person5 {
  name: string
  constructor(name: string) { this.name = name }
  greet(): string { return "hi " + this.name }
}

function testSafeFieldMethod(): void {
  let p: Person5 | undefined = undefined
  let n: string | undefined = p?.name
  let g: string | undefined = p?.greet()

  p = new Person5("Bob")
  n = p?.name
  g = p?.greet()
}