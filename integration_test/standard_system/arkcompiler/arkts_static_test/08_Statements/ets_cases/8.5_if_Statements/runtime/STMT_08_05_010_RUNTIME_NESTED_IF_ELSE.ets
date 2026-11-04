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
 * @id STMT_08_05_010_RUNTIME_NESTED_IF_ELSE
 * @expect runtime
 * @section 8.5
 * @design 运行时验证嵌套 if-else 的多层分支选择正确性以及 else if 链式语义
 * @note 运行时用例：外层/内层条件组合、else if 链
 */
function main(): void {
  let x: int = 5
  let y: int = 3
  let result: int = 0

  // 外层 true，内层 true
  if (x > 0) {
    if (y > 0) {
      result = 1
    } else {
      result = 2
    }
  } else {
    result = 3
  }
  if (result != 1) {
    throw new Error("nested outer-true/inner-true failed: expected 1, got " + result)
  }

  // 外层 true，内层 false
  y = -1
  result = 0
  if (x > 0) {
    if (y > 0) {
      result = 1
    } else {
      result = 2
    }
  } else {
    result = 3
  }
  if (result != 2) {
    throw new Error("nested outer-true/inner-false failed: expected 2, got " + result)
  }

  // 外层 false
  x = -5
  result = 0
  if (x > 0) {
    if (y > 0) {
      result = 1
    } else {
      result = 2
    }
  } else {
    result = 3
  }
  if (result != 3) {
    throw new Error("nested outer-false failed: expected 3, got " + result)
  }

  // else if 链式条件
  x = 10
  if (x > 100) {
    result = 4
  } else if (x > 50) {
    result = 5
  } else if (x > 0) {
    result = 6
  } else {
    result = 7
  }
  if (result != 6) {
    throw new Error("else-if chain (x=10) failed: expected 6, got " + result)
  }

  // else if 链，命中第一个分支
  x = 200
  if (x > 100) {
    result = 4
  } else if (x > 50) {
    result = 5
  } else if (x > 0) {
    result = 6
  } else {
    result = 7
  }
  if (result != 4) {
    throw new Error("else-if chain (x=200) failed: expected 4, got " + result)
  }

  // else if 链，命中中间分支
  x = 60
  if (x > 100) {
    result = 4
  } else if (x > 50) {
    result = 5
  } else if (x > 0) {
    result = 6
  } else {
    result = 7
  }
  if (result != 5) {
    throw new Error("else-if chain (x=60) failed: expected 5, got " + result)
  }

  // else if 链，走最终 else
  x = -1
  if (x > 100) {
    result = 4
  } else if (x > 50) {
    result = 5
  } else if (x > 0) {
    result = 6
  } else {
    result = 7
  }
  if (result != 7) {
    throw new Error("else-if chain final else failed: expected 7, got " + result)
  }

  console.log("verified")
}
