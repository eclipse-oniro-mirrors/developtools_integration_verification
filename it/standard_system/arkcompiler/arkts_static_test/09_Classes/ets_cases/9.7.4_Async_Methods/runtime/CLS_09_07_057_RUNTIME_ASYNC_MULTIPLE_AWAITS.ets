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
 * @id CLS_09_07_057_RUNTIME_ASYNC_MULTIPLE_AWAITS
 * @expect runtime
 * @section 9.7.4
 * @design async 方法多个 await 挂起点运行时验证
 * @note 运行时用例
 */
class MultiAwait057 {
  async step1(): Promise<int> { return 10 }
  async step2(i: int): Promise<int> { return i + 20 }
}
function main(): void {
  console.log("verified")
}
