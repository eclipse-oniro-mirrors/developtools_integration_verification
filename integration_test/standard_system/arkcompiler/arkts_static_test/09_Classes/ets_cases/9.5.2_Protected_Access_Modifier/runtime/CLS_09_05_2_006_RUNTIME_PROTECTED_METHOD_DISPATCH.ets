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
 * @id CLS_09_05_2_006_RUNTIME_PROTECTED_METHOD_DISPATCH
 * @expect runtime
 * @section 9.5.2
 * @design protected方法派发运行时验�?
 * @note 运行时用例：验证protected方法在继承链中的调用
 */
class ProtDispatchBase {
  protected greet(): string { return "base" }
  public callGreet(): string { return this.greet() }
}
class ProtDispatchSub extends ProtDispatchBase {
  protected greet(): string { return "sub" }
}

function main(): void {
  let s = new ProtDispatchSub()
  if (s.callGreet() != "sub") {
    throw new Error("callGreet() should be 'sub'")
  }
  console.log("Protected method dispatch verified")
}
