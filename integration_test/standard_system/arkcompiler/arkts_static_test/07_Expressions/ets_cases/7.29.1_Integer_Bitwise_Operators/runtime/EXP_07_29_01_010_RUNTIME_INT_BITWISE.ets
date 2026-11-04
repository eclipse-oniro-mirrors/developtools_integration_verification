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
 * @id EXP_07_29_01_010_RUNTIME_INT_BITWISE
 * @expect runtime
 * @section 7.29.1
 * @design int 类型位运算符（&, ^, |）运行时正确性验证：用已知二进制值的位运算结果验证
 * @note 运行时用例：验证 int 位运算的值正确性，包括正数、负数、零、掩码等场景
 */
function assert(cond: boolean, msg: string): void {
    if (!cond) {
    throw new Error('FAIL: ' + msg);
  }
  }
  }
  }
    }
}

function main(): void {
    // 基本位运算：5(0101) & 3(0011) = 1(0001)
    assert((5 & 3) == 1, '5 & 3 should be 1');

    // 按位或：5(0101) | 3(0011) = 7(0111)
    assert((5 | 3) == 7, '5 | 3 should be 7');

    // 按位异或：5(0101) ^ 3(0011) = 6(0110)
    assert((5 ^ 3) == 6, '5 ^ 3 should be 6');

    // 零值运算
    assert((0 & 5) == 0, '0 & 5 should be 0');
    assert((0 | 5) == 5, '0 | 5 should be 5');
    assert((0 ^ 5) == 5, '0 ^ 5 should be 5');

    // 全 1 掩码（-1）
    assert((-1 & 5) == 5, "-1 & 5 should be 5");
    assert((-1 | 5) == -1, "-1 | 5 should be -1");

    // 与自身
    let a: int = 42;
    assert((a & a) == 42, 'a & a should be a');
    assert((a | a) == 42, 'a | a should be a');
    assert((a ^ a) == 0, "a ^ a should be 0");

    // 大整数位运算
    let big1: int = 65535;
    let big2: int = 255;
    assert((big1 & big2) == 255, '65535 & 255 should be 255');
    assert((big1 | big2) == 65535, '65535 | 255 should be 65535');

    // 负数的位运算
    let neg: int = -42;
    assert((neg & neg) == neg, "-42 & -42 should be -42");
    assert((neg ^ neg) == 0, "-42 ^ -42 should be 0");

    // 幂等性
    assert((5 & 7 & 5) == 5, '5 & 7 & 5 should be 5');

    console.log('verified');
}
