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
 * @id CLS_09_05_1_008_RUNTIME_PRIVATE_ACCESS_IN_CLASS
 * @expect runtime
 * @section 9.5.1
 * @design 类内访问private成员运行时验�?
 * @note 运行时用例：验证类内private访问正确执行
 */
class PrivRt {
  private val: int = 42
  getVal(): int { return this.val }
  setVal(v: int): void { this.val = v }
}

function main(): void {
  let p = new PrivRt()
  if (p.getVal() != 42) {
    throw new Error("getVal() should be 42")
  }
  p.setVal(100)
  if (p.getVal() != 100) {
    throw new Error("getVal() should be 100")
  }
  console.log("Private access in class verified")
}
