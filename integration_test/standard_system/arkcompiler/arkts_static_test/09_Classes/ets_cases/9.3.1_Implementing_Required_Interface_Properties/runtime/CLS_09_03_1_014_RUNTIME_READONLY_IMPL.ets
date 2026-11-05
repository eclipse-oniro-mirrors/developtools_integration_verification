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
 * @id CLS_09_03_1_014_RUNTIME_READONLY_IMPL
 * @expect runtime
 * @section 9.3.1
 * @design readonly属性实现运行时验证
 * @note 运行时用例：验证readonly属性读取正�?
 */
interface IRead4 {
  readonly r: number
}
class CRead4 implements IRead4 {
  r: number = 42
}

function main(): void {
  let c = new CRead4()
  let i: IRead4 = c
  if (i.r != 42) {
    throw new Error("i.r should be 42")
  }
  console.log("Readonly impl verified")
}
