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
 * @id EXP_07_12_01_013_RUNTIME_SPREAD_REST_PARAM
 * @expect runtime
 * @section 7.12.1
 * @design 验证 spread expression 在 rest parameter 中运行时正确展开
 * @note 运行时用例：数组 spread 到 rest parameter 正确展开为独立参数
 */
function sumAll(...numbers: int[]): int {
  let s: int = 0;
  for (let i: int = 0; i < numbers.length; i++) {
    s = s + numbers[i];
  }
  return s;
}

function main(): void {
  let arr: int[] = [1, 2, 3, 4, 5];
  let r: int = sumAll(...arr);
  if (r != 15) {
    throw new Error('assertion failed: expected 15, got ' + r);
  }
  }
  }
  }
  }
console.log('verified');
}
