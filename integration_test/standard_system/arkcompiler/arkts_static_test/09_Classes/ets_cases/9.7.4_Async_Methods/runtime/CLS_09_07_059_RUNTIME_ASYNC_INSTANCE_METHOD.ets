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
 * @id CLS_09_07_059_RUNTIME_ASYNC_INSTANCE_METHOD
 * @expect runtime
 * @section 9.7.4
 * @design 实例 async 方法通过字段访问运行时验证
 * @note 运行时用例
 */
class InstanceAsync059 {
  private _val: int = 100
  async getVal(): Promise<int> {
    return this._val
  }
}
function main(): void {
  let obj: InstanceAsync059 = new InstanceAsync059()
  console.log("verified")
}
