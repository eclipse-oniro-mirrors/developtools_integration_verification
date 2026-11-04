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
 * @id CLS_09_06_1_006_RUNTIME_STATIC_FIELD_SHARED
 * @expect runtime
 * @section 9.6.1
 * @design static字段所有实例共享验�?
 * @note 运行时用例：验证static字段只有一个副�?
 */
class SharedStatic {
  static counter: int = 0
  instanceId: int = 0
  constructor() {
    SharedStatic.counter++
    this.instanceId = SharedStatic.counter
  }
}
function main(): void {
  let a = new SharedStatic()
  let b = new SharedStatic()
  if (SharedStatic.counter != 2) { throw new Error("counter should be 2") }
  if (a.instanceId != 1) { throw new Error("a.instanceId should be 1") }
  if (b.instanceId != 2) { throw new Error("b.instanceId should be 2") }
  console.log("Static field shared verified")
}
