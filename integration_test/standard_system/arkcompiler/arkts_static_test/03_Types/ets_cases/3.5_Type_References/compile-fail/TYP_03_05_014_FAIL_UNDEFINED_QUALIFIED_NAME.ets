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
 * @id TYP_03_05_014_FAIL_UNDEFINED_QUALIFIED_NAME
 * @expect compile-fail
 * @section 3.5
 * @design 引用 namespace 中不存在的类型
 * @note 反向用例：namespace 内部不存在的类型名
 */
namespace ns14 {
  export class Existing {
    v: int = 0
  }
}

function testUndefinedQualifiedFail(): void {
  let x: ns14.NonExistent = null
  let y: ns14.AlsoMissing = null
}