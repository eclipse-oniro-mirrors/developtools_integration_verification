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
 * @id CLS_09_04_008_RUNTIME_MEMBER_ACCESS
 * @expect runtime
 * @section 9.4
 * @design 类成员访问运行时验证
 * @note 运行时用例：验证字段和方法读写执行正�?
 */
class MemberTest {
  val: int = 0
  getVal(): int { return this.val }
  setVal(v: int): void { this.val = v }
}

function main(): void {
  let m = new MemberTest()
  m.setVal(42)
  if (m.getVal() != 42) {
    throw new Error("getVal() should be 42")
  }
  console.log("Member access verified")
}
