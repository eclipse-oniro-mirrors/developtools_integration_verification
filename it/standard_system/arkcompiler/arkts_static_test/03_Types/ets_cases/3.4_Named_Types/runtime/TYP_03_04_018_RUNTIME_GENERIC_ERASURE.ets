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
 * @id TYP_03_04_018_RUNTIME_GENERIC_ERASURE
 * @expect runtime
 * @section 3.4
 * @design 泛型命名类型运行时类型擦除（与 Java 类似）
 * @note 运行时用例：泛型实例的运行时行为，多个 T 实例化共享类
 */
class RtBox<T> {
  value: T
  constructor(v: T) { this.value = v }
  get(): T { return this.value }
}

function main(): void {
  // 不同 T 实例化的 RtBox<int>/<string> 在编译期是不同 named types
  // 运行时由于类型擦除，instanceof RtBox 都为 true
  let bi: RtBox<int> = new RtBox<int>(42)
  let bs: RtBox<string> = new RtBox<string>("hello")

  if (!(bi instanceof RtBox)) {
    throw new Error("bi should be instance of RtBox")
  }
  if (!(bs instanceof RtBox)) {
    throw new Error("bs should be instance of RtBox")
  }

  // 值仍然正确保存
  if (bi.get() != 42) {
    throw new Error("bi.get failed")
  }
  if (bs.get() != "hello") {
    throw new Error("bs.get failed")
  }

  console.log("Generic erasure verified")
}