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
 * @id CLS_09_05_3_003_RUNTIME_PUBLIC_ACCESS
 * @expect runtime
 * @section 9.5.3
 * @design public成员运行时访问验�?
 * @note 运行时用例：验证public成员外部读写
 */
class PubRt {
  public val: int = 10
  public getVal(): int { return this.val }
}

function main(): void {
  let p = new PubRt()
  if (p.val != 10) {
    throw new Error("p.val should be 10")
  }
  if (p.getVal() != 10) {
    throw new Error("p.getVal() should be 10")
  }
  p.val = 20
  if (p.val != 20) {
    throw new Error("p.val should be 20")
  }
  console.log("Public access verified")
}
