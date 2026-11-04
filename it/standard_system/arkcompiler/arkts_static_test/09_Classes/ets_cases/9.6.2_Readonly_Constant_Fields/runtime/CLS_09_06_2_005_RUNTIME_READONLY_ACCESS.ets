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
 * @id CLS_09_06_2_005_RUNTIME_READONLY_ACCESS
 * @expect runtime
 * @section 9.6.2
 * @design readonly字段访问运行时验�?
 * @note 运行时用例：验证readonly字段可读不可�?
 */
class ReadonlyRt {
  readonly val: int = 42
  getVal(): int { return this.val }
}
function main(): void {
  let r = new ReadonlyRt()
  if (r.getVal() != 42) { throw new Error("getVal() should be 42") }
  if (r.val != 42) { throw new Error("r.val should be 42") }
  console.log("Readonly access verified")
}
