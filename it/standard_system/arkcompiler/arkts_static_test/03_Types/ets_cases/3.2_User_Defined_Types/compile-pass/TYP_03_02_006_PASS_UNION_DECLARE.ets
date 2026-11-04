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
 * @id TYP_03_02_006_PASS_UNION_DECLARE
 * @expect compile-pass
 * @section 3.2
 * @design 用户定义联合类型: T1 | T2 声明、赋值、instanceof 类型收窄
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function processUnion(x: int | string): void {
  if (x instanceof string) {
    let s: string = x as string
  } else {
    let n: int = x as int
  }
}

function testUnionDeclare(): void {
  let u1: int | string = 42
  u1 = "hello"

  let u2: string | boolean = "world"
  u2 = false

  let u3: int | double | string = 3.14
  u3 = 42
  u3 = "pi"

  processUnion(1)
  processUnion("a")
}