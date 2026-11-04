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
 * @id EXP_07_21_06_032_RUNTIME_INT_MIN_NEGATE
 * @expect runtime
 * @section 7.21.6
 * @design 验证 -int.MIN_VALUE 溢出包装行为。
 *         spec: -int.MIN_VALUE = int.MIN_VALUE（求反溢出，不抛错）。
 * @note 运行时用例：-int.MIN 静默溢出 = int.MIN
 */
function main(): void {
    let x: int = -2147483648;
    let r: int = -x;
    if (r != -2147483648) {
    throw new Error('assertion failed: expected -int.MIN = int.MIN, got ' + r);
  }
  }
  }
  }
    }
console.log('verified');
}
