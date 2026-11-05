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
 * @id CLS_09_03_1_013_RUNTIME_INTERFACE_REF_ACCESS
 * @expect runtime
 * @section 9.3.1
 * @design 通过接口引用访问隐式getter验证
 * @note 运行时用例：验证接口引用调用隐式getter/setter
 */
interface IAccess {
  n: number
}
class CAccess implements IAccess {
  n: number = 10
}

function main(): void {
  let c = new CAccess()
  let i: IAccess = c
  if (i.n != 10) {
    throw new Error("i.n should be 10")
  }
  i.n = 20
  if (i.n != 20) {
    throw new Error("i.n should be 20 after assignment")
  }
  console.log("Interface ref access verified")
}
