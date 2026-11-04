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
 * @id STMT_08_13_012_RUNTIME_null_case_matching
 * @expect runtime
 * @section 8.13
 * @design switch 匹配 null 值 — 严格参照 STATEMENTS.md §8.13 示例
 * @note 运行时用例：验证 class + null union 的 switch null case 匹配
 */
class MySwitchBox {
  value: int
  constructor(v: int) { this.value = v }
}

function makeBox(): MySwitchBox | null {
  return new MySwitchBox(1)
}

function makeNull(): MySwitchBox | null {
  return null
}

function main(): void {
  let a: MySwitchBox | null = makeNull()
  let matched: int = 0
  switch (a) {
    case null:
      matched = 1
      break
    default:
      matched = 2
      break
  }
  if (matched != 1) { throw new Error("Expected null case to match, got " + matched) }

  a = makeBox()
  matched = 0
  switch (a) {
    case null:
      matched = 1
      break
    default:
      matched = 2
      break
  }
  if (matched != 2) { throw new Error("Expected default case to match, got " + matched) }

  console.log("verified")
}
