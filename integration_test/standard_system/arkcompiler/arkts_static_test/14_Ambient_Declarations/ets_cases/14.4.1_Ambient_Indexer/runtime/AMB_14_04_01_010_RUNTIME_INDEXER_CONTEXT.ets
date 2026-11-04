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
 * @id AMB_14_04_01_010_RUNTIME_INDEXER_CONTEXT
 * @expect runtime
 * @section 14.4.1
 * @design ambient class 含 indexer 与 main 共存，验证不影响编译执行
 * @note 运行时用例：验证 ambient indexer 不影响其他代码运行
 */
declare class Indexable {
  [index: number]: string
}

function main(): void {
  let x: int = 7
  if (x != 7) {
    throw new Error('assertion failed: ' + x)
  }
  console.log('verified')
}
