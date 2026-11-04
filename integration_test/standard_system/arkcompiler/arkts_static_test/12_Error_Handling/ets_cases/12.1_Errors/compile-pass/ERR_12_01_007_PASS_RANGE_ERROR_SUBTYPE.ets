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
 * @id ERR_12_01_007_PASS_RANGE_ERROR_SUBTYPE
 * @expect compile-pass
 * @section 12.1
 * @design 标准库 RangeError 是 Error 子类，可作为 Error 处理
 * @note 正向用例：验证 RangeError 可赋值给 Error 并可被 throw
 */
function throwRangeError(): void {
  let err: Error = new RangeError()
  throw err
}
