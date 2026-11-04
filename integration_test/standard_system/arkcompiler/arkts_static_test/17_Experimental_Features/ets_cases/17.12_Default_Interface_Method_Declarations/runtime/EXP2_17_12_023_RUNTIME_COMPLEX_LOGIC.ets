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
 * @id EXP2_17_12_023_RUNTIME_COMPLEX_LOGIC
 * @expect runtime
 * @section 17.12
 * @design 默认方法包含条件分支、循环、this属性访问等复杂逻辑，运行时验证所有逻辑正确执行
 * @note 运行时用例：验证默认方法中的复杂逻辑在运行时正确执行
 */
interface IDataProcessor {
  threshold: int

  processData(values: int[]): int {
    let sum: int = 0
    let count: int = 0
    for (let i: int = 0; i < values.length; i++) {
      let v: int = values[i]
      if (v > this.threshold) {
        sum = sum + v
        count = count + 1
      }
    }
    if (count > 0) {
      let avg: int = sum / count
      return avg
    } else {
      return 0
    }
  }

  getCategory(score: int): string {
    if (score >= 90) {
      return 'A'
    } else if (score >= 80) {
      return 'B'
    } else if (score >= 70) {
      return 'C'
    } else if (score >= 60) {
      return 'D'
    } else {
      return 'F'
    }
  }
}

class Processor implements IDataProcessor {
  public threshold: int = 50
}

function main(): void {
  let proc: Processor = new Processor()

  // Test 1: processData with values above and below threshold
  let arr: int[] = [10, 60, 20, 80, 30, 100]
  let avg: int = proc.processData(arr)
  // Values above 50: 60, 80, 100 -> sum=240, count=3, avg=80
  if (avg != 80) {
    throw new Error("FAIL: processData expected 80, got " + avg)
  }

  // Test 2: processData with no values above threshold
  let arr2: int[] = [10, 20, 30, 40]
  let avg2: int = proc.processData(arr2)
  if (avg2 != 0) {
    throw new Error("FAIL: processData for empty match expected 0, got " + avg2)
  }

  // Test 3: getCategory
  let catA: string = proc.getCategory(95)
  if (catA != 'A') {
    throw new Error("FAIL: getCategory(95) expected A, got " + catA)
  }

  let catB: string = proc.getCategory(85)
  if (catB != 'B') {
    throw new Error("FAIL: getCategory(85) expected B, got " + catB)
  }

  let catF: string = proc.getCategory(55)
  if (catF != 'F') {
    throw new Error("FAIL: getCategory(55) expected F, got " + catF)
  }

  // Test 4: threshold accessible via this
  if (proc.threshold != 50) {
    throw new Error("FAIL: threshold expected 50, got " + proc.threshold)
  }

  console.log('PASS: complex logic in default methods works correctly')
}
