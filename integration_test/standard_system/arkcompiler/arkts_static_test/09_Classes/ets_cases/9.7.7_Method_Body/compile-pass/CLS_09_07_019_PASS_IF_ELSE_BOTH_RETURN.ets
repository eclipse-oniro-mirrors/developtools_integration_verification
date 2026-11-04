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
 * @id CLS_09_07_019_PASS_IF_ELSE_BOTH_RETURN
 * @expect compile-pass
 * @section 9.7.7
 * @design 所有条件分支均有return语句的非void方法可正常编译
 * @note 正向用例：if-else、if-else if-else、嵌套条件分支均有return覆盖
 */
class AllPathsReturn019 {
  // Simple if-else both return
  max(a: int, b: int): int {
    if (a > b) {
      return a
    } else {
      return b
    }
  }

  // if-else if-else chain all return
  sign(val: int): int {
    if (val > 0) {
      return 1
    } else if (val < 0) {
      return -1
    } else {
      return 0
    }
  }

  // Nested if-else with all paths covered
  categorize(x: int, y: int): string {
    if (x > 0) {
      if (y > 0) {
        return "quadrant-I"
      } else {
        return "quadrant-IV"
      }
    } else {
      if (y > 0) {
        return "quadrant-II"
      } else {
        return "quadrant-III"
      }
    }
  }

  // Return after if block (the if has return, fallthrough also has return)
  clampWithDefault(val: int, min: int, max: int): int {
    if (val < min) {
      return min
    }
    if (val > max) {
      return max
    }
    return val
  }
}

abstract class AbstractAllPaths019 {
  abstract transform(a: int): int

  // Concrete method in abstract class with all paths covered
  doubleTransform(a: int): int {
    if (a > 0) {
      return a * 2
    } else {
      return a
    }
  }
}
