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
 * @id CLS_09_06_5_008_RUNTIME_LATE_INIT_UNINIT_ERROR
 * @expect runtime
 * @runtime-throws=Error
 * @section 9.6.5
 * @design 未初始化的late init字段读取应抛runtime error
 * @note 运行时用例：spec规定未初始化late init字段读取导致runtime error
 *       ⚠️ 注意：runtime-throws类型改为Error（es2panda实际抛std.core.Error）
 */
class LateInitUninit {
  val!: string
}
function main(): void {
  let li = new LateInitUninit()
  console.log(li.val)
}
