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
 * @id CLS_09_05_2_005_RUNTIME_PROTECTED_IN_SUBCLASS
 * @expect runtime
 * @section 9.5.2
 * @design 子类访问protected成员运行时验�?
 * @note 运行时用例：验证protected成员在子类中正确执行
 */
class ProtRtBase {
  protected val: int = 10
  protected getVal(): int { return this.val }
}
class ProtRtSub extends ProtRtBase {
  useProtected(): int { return this.getVal() }
}

function main(): void {
  let s = new ProtRtSub()
  if (s.useProtected() != 10) {
    throw new Error("useProtected() should be 10")
  }
  console.log("Protected in subclass verified")
}
