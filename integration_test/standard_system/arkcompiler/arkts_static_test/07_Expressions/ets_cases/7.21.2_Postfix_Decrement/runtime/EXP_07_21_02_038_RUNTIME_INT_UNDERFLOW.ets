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
 * @id EXP_07_21_02_038_RUNTIME_INT_UNDERFLOW
 * @expect runtime
 * @section 7.21.2
 * @design 验证 int 最小值后置递减的溢出行为。
 *         int.MIN_VALUE (-2147483648) -- 应回绕为 int.MAX_VALUE (2147483647)。
 *         返回值为溢出前的最小值，变量变为最大值。
 * @note 运行时用例：int 最小值递减溢出行为验证
 */
function main(): void {
    let x: int = -2147483648;
    let result: int = x--;
    if (result != -2147483648) {
    throw new Error('assertion failed: expected return value -2147483648, got ' + result);
  }
  }
  }
  }
    }
    if (x != 2147483647) {
    throw new Error('assertion failed: expected x=2147483647, got ' + x);
  }
  }
  }
  }
    }
console.log('verified');
}
