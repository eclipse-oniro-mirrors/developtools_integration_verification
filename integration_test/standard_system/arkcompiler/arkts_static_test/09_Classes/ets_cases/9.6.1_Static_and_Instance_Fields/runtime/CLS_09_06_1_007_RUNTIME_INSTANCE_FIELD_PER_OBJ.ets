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
 * @id CLS_09_06_1_007_RUNTIME_INSTANCE_FIELD_PER_OBJ
 * @expect runtime
 * @section 9.6.1
 * @design instance字段每个实例独立验证
 * @note 运行时用例：验证不同实例的instance字段互不影响
 */
class InstPerObj {
  val: int = 0
}
function main(): void {
  let a = new InstPerObj()
  let b = new InstPerObj()
  a.val = 10
  b.val = 20
  if (a.val != 10) { throw new Error("a.val should be 10") }
  if (b.val != 20) { throw new Error("b.val should be 20") }
  console.log("Instance field per obj verified")
}
