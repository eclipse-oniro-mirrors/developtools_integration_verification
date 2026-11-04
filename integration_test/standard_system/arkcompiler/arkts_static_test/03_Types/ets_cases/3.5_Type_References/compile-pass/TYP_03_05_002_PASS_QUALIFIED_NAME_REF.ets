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
 * @id TYP_03_05_002_PASS_QUALIFIED_NAME_REF
 * @expect compile-pass
 * @section 3.5
 * @design 通过 qualified name 引用 namespace 内类型
 * @note 正向用例：namespace.TypeName 限定名引用
 */
namespace ns2 {
  export class Inner {
    v: int = 0
    method(): int { return this.v }
  }

  export interface InnerI {
    work(): string
  }

  export enum InnerE { A, B }
}

function testQualifiedNameRef(): void {
  let c: ns2.Inner = new ns2.Inner()
  let e: ns2.InnerE = ns2.InnerE.A
}