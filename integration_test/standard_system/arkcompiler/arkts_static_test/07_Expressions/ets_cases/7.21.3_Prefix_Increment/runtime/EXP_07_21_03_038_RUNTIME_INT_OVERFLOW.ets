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
 * @id EXP_07_21_03_038_RUNTIME_INT_OVERFLOW
 * @expect runtime
 * @section 7.21.3
 * @design 验证 int 最大值前置递增的溢出行为。
 *         ++int.MAX_VALUE (2147483647) 应回绕为 int.MIN_VALUE (-2147483648)。
 *         与后置递增不同：前置返回新值（溢出后的值）。
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    let x: int = 2147483647;
    let result: int = ++x;
    if (result != -2147483648) {
    throw new Error('assertion failed: expected return value -2147483648, got ' + result);
  }
  }
  }
  }
    }
    if (x != -2147483648) {
    throw new Error('assertion failed: expected x=-2147483648, got ' + x);
  }
  }
  }
  }
    }
console.log('verified');
}
