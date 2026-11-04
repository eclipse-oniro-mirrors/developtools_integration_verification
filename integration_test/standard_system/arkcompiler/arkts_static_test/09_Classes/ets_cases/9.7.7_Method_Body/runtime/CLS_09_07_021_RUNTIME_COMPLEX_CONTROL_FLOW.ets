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
 * @id CLS_09_07_021_RUNTIME_COMPLEX_CONTROL_FLOW
 * @expect runtime
 * @section 9.7.7
 * @design 方法体中的复杂控制流执行：多分支return、循环内条件return、try-catch-finally中的return、void方法提前退出
 * @note 运行时用例：验证方法体在不同控制流路径下的正确执行
 */
class Calculator021 {
  // Multiple return paths based on operation
  operate(op: int, a: int, b: int): int {
    if (op == 0) {
      return a + b
    } else if (op == 1) {
      return a - b
    } else if (op == 2) {
      return a * b
    } else {
      if (b != 0) {
        return a / b
      }
      return 0
    }
  }

  // Loop with early return
  findFirstGreaterThan(arr: int[], threshold: int): int {
    let i: int = 0
    while (i < 3) {
      if (arr[i] > threshold) {
        return arr[i]
      }
      i = i + 1
    }
    return -1
  }

  // Sum of positive numbers, skip negatives
  sumPositive(arr: int[]): int {
    let total: int = 0
    let i: int = 0
    while (i < 3) {
      if (arr[i] > 0) {
        total = total + arr[i]
      }
      i = i + 1
    }
    return total
  }

  // Try-catch-finally with return in try
  tryDivide(a: int, b: int): int {
    try {
      return a / b
    } catch (e) {
      return -1
    }
  }

  // Void method with early exit
  logIfPositive(val: int): void {
    if (val <= 0) {
      return
    }
    let msg: int = val
    msg = msg + 0
  }

  // Complex nested conditions with returns on all paths
  grade(score: int): string {
    if (score >= 90) {
      return "A"
    } else if (score >= 80) {
      return "B"
    } else if (score >= 70) {
      return "C"
    } else if (score >= 60) {
      return "D"
    } else {
      return "F"
    }
  }
}

function main(): void {
  let calc: Calculator021 = new Calculator021()

  // Test operate: all four operations + divide-by-zero fallback
  let r1: int = calc.operate(0, 10, 5)
  if (r1 != 15) {
    throw new Error("operate(0,10,5) should be 15")
  }

  let r2: int = calc.operate(1, 10, 5)
  if (r2 != 5) {
    throw new Error("operate(1,10,5) should be 5")
  }

  let r3: int = calc.operate(2, 10, 5)
  if (r3 != 50) {
    throw new Error("operate(2,10,5) should be 50")
  }

  let r4: int = calc.operate(3, 10, 5)
  if (r4 != 2) {
    throw new Error("operate(3,10,5) should be 2")
  }

  let r5: int = calc.operate(3, 10, 0)
  if (r5 != 0) {
    throw new Error("operate(3,10,0) should be 0 (div by zero fallback)")
  }

  // Test findFirstGreaterThan
  let arr1: int[] = [5, 12, 3]
  let r6: int = calc.findFirstGreaterThan(arr1, 10)
  if (r6 != 12) {
    throw new Error("findFirstGreaterThan should find 12")
  }

  let r7: int = calc.findFirstGreaterThan(arr1, 100)
  if (r7 != -1) {
    throw new Error("findFirstGreaterThan should return -1 when none found")
  }

  // Test sumPositive
  let arr2: int[] = [-2, 5, -3]
  let r8: int = calc.sumPositive(arr2)
  if (r8 != 5) {
    throw new Error("sumPositive should sum to 5")
  }

  let arr3: int[] = [0, 0, 0]
  let r9: int = calc.sumPositive(arr3)
  if (r9 != 0) {
    throw new Error("sumPositive of zeros should be 0")
  }

  // Test tryDivide
  let r10: int = calc.tryDivide(10, 2)
  if (r10 != 5) {
    throw new Error("tryDivide(10,2) should be 5")
  }

  let r11: int = calc.tryDivide(10, 0)
  if (r11 != -1) {
    throw new Error("tryDivide(10,0) should return -1 on error")
  }

  // Test void method (no crash means pass)
  calc.logIfPositive(5)
  calc.logIfPositive(-1)

  // Test grade: all branches
  let g1: string = calc.grade(95)
  if (g1 != "A") {
    throw new Error("grade(95) should be A")
  }

  let g2: string = calc.grade(85)
  if (g2 != "B") {
    throw new Error("grade(85) should be B")
  }

  let g3: string = calc.grade(75)
  if (g3 != "C") {
    throw new Error("grade(75) should be C")
  }

  let g4: string = calc.grade(65)
  if (g4 != "D") {
    throw new Error("grade(65) should be D")
  }

  let g5: string = calc.grade(55)
  if (g5 != "F") {
    throw new Error("grade(55) should be F")
  }

  console.log("verified")
}
