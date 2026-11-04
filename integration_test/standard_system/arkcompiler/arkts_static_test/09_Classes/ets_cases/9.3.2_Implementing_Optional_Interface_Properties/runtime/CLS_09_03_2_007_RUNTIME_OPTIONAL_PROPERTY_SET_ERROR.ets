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
 * @id CLS_09_03_2_007_RUNTIME_OPTIONAL_PROPERTY_SET_ERROR
 * @expect runtime
 * @section 9.3.2
 * @design 不实现可选属性后set操作导致runtime error
 * @note 运行时用例：spec规定不实现可选属性时，默认accessor的set操作
 *       应抛出ThrowException（runtime error）
 *       Spec依据：spec §9.3.2 "c.n = 1" causes ThrowException at runtime
 */
interface IOptSet7 {
  n?: number
}
class COptSet7 implements IOptSet7 {
}

function main(): void {
  let c = new COptSet7()
  try {
    c.n = 1
    throw new Error("c.n = 1 should throw runtime error but did not")
  } catch (e) {
    if (e instanceof Error && e.message === "c.n = 1 should throw runtime error but did not") {
      throw e
    }
    console.log("Optional property set error verified")
  }
}
