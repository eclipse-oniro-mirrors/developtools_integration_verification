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
 * @id CLS_09_01_011_RUNTIME_GENERIC_CLASS_INSTANCE
 * @expect runtime
 * @section 9.1
 * @design 泛型类实例化并验证
 * @note 运行时用例：验证泛型类实例化
 */
class GenBox<T> {
  content: T
  constructor(v: T) {
    this.content = v
  }
  get(): T {
    return this.content
  }
}

function main(): void {
  let b = new GenBox<int>(42)
  if (b.get() != 42) {
    throw new Error("GenBox<int>.get() should be 42")
  }
  let sb = new GenBox<string>("hello")
  if (sb.get() != "hello") {
    throw new Error("GenBox<string>.get() should be 'hello'")
  }
  console.log("Generic class instance verified")
}

