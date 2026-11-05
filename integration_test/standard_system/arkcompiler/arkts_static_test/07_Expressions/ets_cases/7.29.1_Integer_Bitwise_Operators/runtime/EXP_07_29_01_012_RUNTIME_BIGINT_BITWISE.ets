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
 * @id EXP_07_29_01_012_RUNTIME_BIGINT_BITWISE
 * @expect runtime
 * @section 7.29.1
 * @design bigint 类型位运算符（&, ^, |）运行时正确性验证
 * @note 运行时用例：验证 bigint 大数位运算的任意精度正确性
 *       ArkTS 不支持 hex bigint 字面量（0xFFn），全部使用十进制 bigint 字面量
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
    // 基本 bigint 位运算
    let five: bigint = 5n;
    let three: bigint = 3n;
    assert((five & three) == 1n, '5n & 3n should be 1n');
    assert((five | three) == 7n, '5n | 3n should be 7n');
    assert((five ^ three) == 6n, '5n ^ 3n should be 6n');

    // bigint 位运算（十进制）
    // 0xFFFFFF = 16777215, 0xF0F0F0 = 15790320, 0x0F0F0F = 986895
    let bigA: bigint = 16777215n;
    let bigB: bigint = 15790320n;
    assert((bigA & bigB) == 15790320n, "bigint & mask should match 15790320 (0xF0F0F0)");
    assert((bigA | bigB) == 16777215n, "bigint | should combine all bits 16777215 (0xFFFFFF)");
    assert((bigA ^ bigB) == 986895n, "bigint ^ should extract differing bits 986895 (0x0F0F0F)");

    // 大 bigint
    let hugeA: bigint = 65535n;
    let hugeB: bigint = 255n;
    assert((hugeA & hugeB) == 255n, '65535n & 255n should be 255n');
    assert((hugeA | hugeB) == 65535n, '65535n | 255n should be 65535n');

    // 与自身
    let val: bigint = 123456n;
    assert((val & val) == val, 'val & val should be val');
    assert((val ^ val) == 0n, 'val ^ val should be 0n');
    assert((val | val) == val, 'val | val should be val');

    // 负 bigint
    let neg: bigint = -1n;
    assert((neg & five) == five, "-1n & 5n should be 5n");

    // 零值
    let zero: bigint = 0n;
    assert((zero & 100n) == 0n, '0n & 100n should be 0n');
    assert((zero | 100n) == 100n, '0n | 100n should be 100n');
    assert((zero ^ 100n) == 100n, '0n ^ 100n should be 100n');

    console.log('verified');
}
