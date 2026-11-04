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
 * @id AMB_14_04_03_007_RUNTIME_ITERABLE_CONTEXT
 * @expect runtime
 * @section 14.4.3
 * @design ambient iterable 与 main 共存
 * @note 运行时用例：验证 iterable 不影响其他代码运行
 */
declare class C {
  [Symbol.iterator](): Iterator<int>
}

function main(): void {
  let x: int = 1
  if (x != 1) {
    throw new Error('assertion failed')
  }
  console.log('verified')
}
