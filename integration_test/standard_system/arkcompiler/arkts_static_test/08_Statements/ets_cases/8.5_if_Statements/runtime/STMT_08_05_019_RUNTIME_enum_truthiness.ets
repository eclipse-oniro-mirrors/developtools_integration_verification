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
 * @id STMT_08_05_019_RUNTIME_enum_truthiness
 * @expect runtime
 * @section 8.5
 * @design 运行时验证 enum 在 if 条件中的 truthiness — 底层为 0 的成员 → falsy，非 0 → truthy
 * @note 运行时用例：覆盖默认值枚举、显式赋值枚举、枚举变量、枚举字面量、if-else 和无 else 模式
 */
enum Color {
  RED,
  GREEN,
  BLUE
}

enum Status {
  NONE = 0,
  ACTIVE = 1,
  PENDING = 2,
  DELETED = -1
}

function main(): void {
  let r: int = 0

  // Color.RED (默认 0) → falsy: then 不执行
  r = 0
  if (Color.RED) { r = 99 }
  if (r != 0) { throw new Error("Color.RED (0) should be falsy") }

  // Color.GREEN (默认 1) → truthy: then 执行
  r = 0
  if (Color.GREEN) { r = 1 }
  if (r != 1) { throw new Error("Color.GREEN (1) should be truthy") }

  // Color.BLUE (默认 2) → truthy: then 执行
  r = 0
  if (Color.BLUE) { r = 2 }
  if (r != 2) { throw new Error("Color.BLUE (2) should be truthy") }

  // 显式枚举 Status.NONE (0) → falsy: else 执行
  r = 0
  if (Status.NONE) { r = 99 }
  else { r = 3 }
  if (r != 3) { throw new Error("Status.NONE (0) else should execute") }

  // 显式枚举 Status.ACTIVE (1) → truthy
  r = 0
  if (Status.ACTIVE) { r = 4 }
  if (r != 4) { throw new Error("Status.ACTIVE (1) should be truthy") }

  // 显式枚举 Status.PENDING (2) → truthy
  r = 0
  if (Status.PENDING) { r = 5 }
  if (r != 5) { throw new Error("Status.PENDING (2) should be truthy") }

  // 显式枚举 Status.DELETED (-1) → truthy
  r = 0
  if (Status.DELETED) { r = 6 }
  if (r != 6) { throw new Error("Status.DELETED (-1) should be truthy") }

  // 枚举变量 Color.RED (0) → falsy
  r = 0
  let cRed: Color = Color.RED
  if (cRed) { r = 99 }
  if (r != 0) { throw new Error("enum var Color.RED should be falsy") }

  // 枚举变量 Color.GREEN (1) → truthy
  r = 0
  let cGreen: Color = Color.GREEN
  if (cGreen) { r = 7 }
  if (r != 7) { throw new Error("enum var Color.GREEN should be truthy") }

  // !Color.RED (取非 falsy) → truthy
  r = 0
  if (!cRed) { r = 8 }
  if (r != 8) { throw new Error("!Color.RED should be truthy") }

  // !!Color.GREEN (双重否定) → truthy
  r = 0
  if (!!cGreen) { r = 9 }
  if (r != 9) { throw new Error("!!Color.GREEN should be truthy") }

  console.log("verified")
}
