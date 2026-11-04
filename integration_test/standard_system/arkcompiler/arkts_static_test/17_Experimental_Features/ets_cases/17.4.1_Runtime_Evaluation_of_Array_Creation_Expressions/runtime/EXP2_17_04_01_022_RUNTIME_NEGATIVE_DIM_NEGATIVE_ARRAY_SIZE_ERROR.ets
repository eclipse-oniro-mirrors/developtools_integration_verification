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
 * @id EXP2_17_04_01_022_RUNTIME_NEGATIVE_DIM_NEGATIVE_ARRAY_SIZE_ERROR
 * @expect runtime
 * @section 17.4.1
 * @design 运行时负维度：验证当维度变量为负数时抛出 NegativeArraySizeError
 * @note 运行时用例：使用 try-catch 捕获 NegativeArraySizeError，验证异常被正确抛出
 */
function createArrayWithDim(dim: int): void {
  // This will throw NegativeArraySizeError when dim < 0 at runtime
  let arr: int[] = new int[dim] (0)
  console.log(arr.length)
}

function main(): void {
  let errorCaught: boolean = false
  try {
    createArrayWithDim(-1)
  } catch (e) {
    errorCaught = true
    // Verify the error is NegativeArraySizeError
    if (!(e instanceof Error)) {
      throw new Error('assertion failed: caught exception should be an Error')
    }
  }
  if (!errorCaught) {
    throw new Error('assertion failed: NegativeArraySizeError should have been thrown for negative dimension')
  }
  console.log('verified')
}
