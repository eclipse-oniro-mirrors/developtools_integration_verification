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
 * @id TYP_03_05_018_RUNTIME_QUALIFIED_NAME_REF
 * @expect runtime
 * @section 3.5
 * @design qualified name 类型引用 namespace 内类型，运行时可正常实例化
 * @note 运行时用例：namespace.TypeName 引用运行时行为
 */
namespace ns18 {
  export class Service {
    name: string
    constructor(n: string) { this.name = n }
    greet(): string { return "Hello from " + this.name }
  }

  export enum Level { LOW, MEDIUM, HIGH }
}

function main(): void {
  let s: ns18.Service = new ns18.Service("ArkTS")
  let g: string = s.greet()
  if (g != "Hello from ArkTS") {
    throw new Error("qualified name service failed: " + g)
  }

  let l: ns18.Level = ns18.Level.HIGH
  if (l != ns18.Level.HIGH) {
    throw new Error("qualified enum failed")
  }

  console.log("Qualified name ref runtime verified")
}