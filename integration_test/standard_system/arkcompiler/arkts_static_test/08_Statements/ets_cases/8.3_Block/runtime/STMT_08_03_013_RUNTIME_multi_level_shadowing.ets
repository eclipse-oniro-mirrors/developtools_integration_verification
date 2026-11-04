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
 * @id STMT_08_03_013_RUNTIME_multi_level_shadowing
 * @expect runtime
 * @section 8.3
 * @design 验证跨 4 层级嵌套块的变量遮蔽与恢复：每层声明同名变量，退出后外层变量恢复为进入前的值
 * @note 运行时用例：块作用域遮蔽的多层语义验证（spec 8.3 — block 按文本顺序执行，块结束后作用域恢复）
 */
function main(): void {
  let val: string = "level0"

  {
    let val: string = "level1"
    if (val != "level1") {
      throw new Error("shadow level1 failed: expected level1, got " + val)
    }

    {
      let val: string = "level2"
      if (val != "level2") {
        throw new Error("shadow level2 failed: expected level2, got " + val)
      }

      {
        let val: string = "level3"
        if (val != "level3") {
          throw new Error("shadow level3 failed: expected level3, got " + val)
        }

        {
          let val: string = "level4"
          if (val != "level4") {
            throw new Error("shadow level4 failed: expected level4, got " + val)
          }
          // Modify the innermost shadow
          val = "level4-modified"
          if (val != "level4-modified") {
            throw new Error("level4 modify failed: got " + val)
          }
        }
        // After level4 block exits, val restores to level3 (unchanged)
        if (val != "level3") {
          throw new Error("restore level3 failed: expected level3, got " + val)
        }
      }
      // After level3 block exits, val restores to level2 (unchanged)
      if (val != "level2") {
        throw new Error("restore level2 failed: expected level2, got " + val)
      }
    }
    // After level2 block exits, val restores to level1 (unchanged)
    if (val != "level1") {
      throw new Error("restore level1 failed: expected level1, got " + val)
    }
  }
  // After level1 block exits, val restores to level0 (unchanged)
  if (val != "level0") {
    throw new Error("restore level0 failed: expected level0, got " + val)
  }

  console.log("verified")
}
