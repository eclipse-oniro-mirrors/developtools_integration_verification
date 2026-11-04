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
 * @id CLS_09_05_004_RUNTIME_PUBLIC_ACCESS
 * @expect runtime
 * @section 9.5
 * @design public成员访问运行时验�?
 * @note 运行时用例：验证public成员可被外部访问
 */
class PubCls {
  public data: int = 10
  public getData(): int { return this.data }
}

function main(): void {
  let p = new PubCls()
  if (p.data != 10) {
    throw new Error("p.data should be 10")
  }
  if (p.getData() != 10) {
    throw new Error("p.getData() should be 10")
  }
  console.log("Public access verified")
}
