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
 * @id LEX_02_05_038_PASS_OPTIONAL_CHAINING
 * @expect compile-pass
 * @section 2.5
 * @design 可选链运算符 ?.
 * @note compile-pass 用例：验证可选链运算符
 */

// 可选链运算符 ?.
interface Address {
  city: string
}

interface Person {
  name: string
  address?: Address
}

let person: Person = { name: "Alice" }

// 可选链访问
let city = person?.address?.city
