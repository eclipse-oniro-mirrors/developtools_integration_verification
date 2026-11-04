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
 * @id TYP_03_03_008_PASS_INPLACE_UNION
 * @expect compile-pass
 * @section 3.3
 * @section 3.3
 * @design 就地联合类型声明 T1 | T2
 * @note 正向用例：验证就地联合类型声明
 */
function testInplaceUnion(): void {
  let u1: int | string = 1
  u1 = "hello"

  let u2: number | boolean = true
  u2 = 3.14

  // 三类型 union
  let u3: int | string | boolean = 1
  u3 = "x"
  u3 = false
}