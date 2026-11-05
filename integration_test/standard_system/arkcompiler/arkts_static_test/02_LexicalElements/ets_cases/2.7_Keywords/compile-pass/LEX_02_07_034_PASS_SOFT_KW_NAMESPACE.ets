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
 * @id LEX_02_07_034_PASS_SOFT_KW_NAMESPACE
 * @expect compile-pass
 * @section 2.7
 * @design 软关键字: namespace 用于命名空间声明
 * @note 正向用例：namespace 在命名空间上下文中
 */
namespace Util034 {
  export function multiply(x: int): int {
    return x * 2
  }
}

function test034(): void {
  let r: int = Util034.multiply(5)
}
