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
 * @id EXP2_17_15_015_RUNTIME_NAMESPACE
 * @expect runtime
 * @section 17.15
 * @design 验证命名空间内 getter+setter 的读写交互
 * @note 运行时用例：通过命名空间访问 getter/setter 并验证状态一致性
 */
namespace MyNS {
  let nsValue: int = 0

  export get nsPair(): int {
    return nsValue
  }

  export set nsPair(v: int) {
    nsValue = v
  }
}

function main(): void {
  MyNS.nsPair = 42
  let result: int = MyNS.nsPair
  if (result != 42) {
    throw new Error("assertion failed: expected 42, got " + result)
  }
  MyNS.nsPair = result * 2
  if (MyNS.nsPair != 84) {
    throw new Error("assertion failed: expected 84, got " + MyNS.nsPair)
  }
  console.log("verified: namespace getter/setter, final=" + MyNS.nsPair)
}
