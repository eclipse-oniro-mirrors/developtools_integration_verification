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
 * @id EXP_07_35_01_012_RUNTIME_LAMBDA_GENERIC
 * @expect runtime
 * @section 7.35.1
 * @design Lambda 娉涘瀷绫诲瀷鎺ㄦ柇
 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉 Lambda 娉涘瀷绫诲瀷鎺ㄦ柇
 */
function foo<T>(p: (x: T) => T, val: T): T {
  return p(val)
}
function main(): void {
  let f: (x: int) => int = e => e
  let result: int = foo<int>(f, 42)
  if (result != 42) {
    throw new Error('assertion failed: lambda generic')
  }
console.log('verified')
}
