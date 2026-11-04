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
 * @id STMT_08_01_030_RUNTIME_ABRUPT_ABORT
 * @expect runtime
 * @section 8.1
 * @design 异常完成中止后续语句
 * @runtime-throws=Error
 * @note 运行时用例：实际执行验证异常中止
 */
function main(): void {
  let x: int = 0
  x = 1
  throw new Error("abort")
  x = 2
}
