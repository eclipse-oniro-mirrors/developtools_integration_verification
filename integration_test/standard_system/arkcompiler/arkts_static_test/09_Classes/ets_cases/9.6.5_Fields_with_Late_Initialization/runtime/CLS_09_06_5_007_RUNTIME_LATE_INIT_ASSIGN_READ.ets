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
 * @id CLS_09_06_5_007_RUNTIME_LATE_INIT_ASSIGN_READ
 * @expect runtime
 * @section 9.6.5
 * @design late init字段赋值后读取运行时验�?
 * @note 运行时用例：验证late init字段在赋值后可正常读�?
 */
class LateInitRt {
  val!: string
}
function main(): void {
  let li = new LateInitRt()
  li.val = "assigned"
  if (li.val != "assigned") { throw new Error("li.val should be 'assigned'") }
  console.log("Late init assign read verified")
}
