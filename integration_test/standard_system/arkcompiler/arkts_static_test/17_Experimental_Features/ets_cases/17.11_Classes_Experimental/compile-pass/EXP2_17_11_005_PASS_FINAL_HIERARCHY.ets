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
 * @id EXP2_17_11_005_PASS_FINAL_HIERARCHY
 * @expect compile-pass
 * @section 17.11
 * @design 验证多个 final 类独立声明编译通过
 * @note 正向用例：同一模块中声明多个不相关?final ?
 */
final class ConfigA { public name: string = 'a'
}

final class ConfigB {
  name: string = 'b'
}

function main(): void {
  let a: ConfigA = new ConfigA()
  let b: ConfigB = new ConfigB()
  console.log(a.name + b.name)}

