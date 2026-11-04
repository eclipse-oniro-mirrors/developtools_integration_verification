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
 * @id EXP_07_29_01_011_RUNTIME_LONG_BITWISE
 * @expect runtime
 * @section 7.29.1
 * @design long 类型位运算符（&, ^, |）运行时正确性验证
 * @note 运行时用例：验证 long 位运算的值正确性
 *       ArkTS 不支持 L 后缀，long 字面量通过 int 值隐式转换或显式 long() 构造
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
    // 使用 long 变量进行位运算
    let l5: long = 5;
    let l3: long = 3;
    assert((l5 & l3) == 1, '5L & 3L should be 1');
    assert((l5 | l3) == 7, '5L | 3L should be 7');
    assert((l5 ^ l3) == 6, '5L ^ 3L should be 6');

    // 大 long 值（使用 int 范围内的值）
    let la: long = 0x0F0F;
    let lb: long = 0xF0F0;
    let lzero: long = 0;
    assert((la & lb) == lzero, '0x0F0F & 0xF0F0 should be 0');

    let lc: long = 0xFFFF;
    let ld: long = 0xFF00;
    let expect: long = 0xFF00;
    assert((lc & ld) == expect, '0xFFFF & 0xFF00 should be 0xFF00');

    // 与自身
    let val: long = 12345;
    assert((val & val) == val, 'val & val should be val');
    assert((val ^ val) == lzero, "val ^ val should be 0");
    assert((val | val) == val, 'val | val should be val');

    // 负 long
    let nlong: long = -1;
    assert((nlong & l5) == l5, "-1 & 5 should be 5");
    assert((nlong | l5) == nlong, "-1 | 5 should be -1");

    // 零值
    assert((lzero & 100) == lzero, '0 & 100 should be 0');
    let l100: long = 100;
    assert((lzero | l100) == l100, '0 | 100 should be 100');
    assert((lzero ^ l100) == l100, '0 ^ 100 should be 100');

    console.log('verified');
}
