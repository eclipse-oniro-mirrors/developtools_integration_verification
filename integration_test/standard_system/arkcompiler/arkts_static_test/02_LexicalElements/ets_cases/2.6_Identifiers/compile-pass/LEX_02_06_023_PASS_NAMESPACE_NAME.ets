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
 * @id LEX_02_06_023_PASS_NAMESPACE_NAME
 * @expect compile-pass
 * @section 2.6
 * @design 标识符作为命名空间名
 * @note 正向用例：命名空间支持 Unicode 标识符
 */
namespace 工具集023 {
  export function 加法(a: int, b: int): int {
    return a + b
  }
}

function testNamespaceName(): void {
  let r: int = 工具集023.加法(1, 2)
}
