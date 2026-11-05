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
 * @id CLS_09_06_2_006_RUNTIME_READONLY_INIT_IN_CTOR
 * @expect runtime
 * @section 9.6.2
 * @design 构造器中初始化readonly字段运行时验�?
 * @note 运行时用例：验证readonly字段可在构造器中赋�?
 */
class ReadonlyCtor {
  readonly val: int
  constructor(v: int) {
    this.val = v
  }
}
function main(): void {
  let r = new ReadonlyCtor(99)
  if (r.val != 99) { throw new Error("r.val should be 99") }
  console.log("Readonly init in ctor verified")
}
