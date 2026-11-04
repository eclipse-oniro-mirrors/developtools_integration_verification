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
 * @id EXP_07_29_01_013_RUNTIME_FLOAT_DOUBLE_TRUNCATION
 * @expect runtime
 * @section 7.29.1
 * @design float/double 类型位运算时截断为整数后的运行时正确性验证
 * @note 运行时用例：验证 float/double 值截断为整数后按位运算的结果正确性
 *       例如 3.14 截断为 3，然后进行 &, ^, |
 *       float 截断为 int，double 截断为 long
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
    // float 截断：3.14 → 3, 1.99 → 1（float 截断为 int）
    let fa: float = 3.14f;
    let fb: float = 1.99f;
    assert((fa & fb) == 1, '3.14 & 1.99 should be 1 (3 & 1 = 1)');
    assert((fa | fb) == 3, '3.14 | 1.99 should be 3 (3 | 1 = 3)');
    assert((fa ^ fb) == 2, '3.14 ^ 1.99 should be 2 (3 ^ 1 = 2)');

    // float 截断为 0 的情况
    let fSmall: float = 0.99f;
    let fVal: float = 5.0f;
    assert((fSmall & fVal) == 0, '0.99 & 5.0 should be 0 (0 & 5 = 0)');
    assert((fSmall | fVal) == 5, '0.99 | 5.0 should be 5 (0 | 5 = 5)');

    // double 截断（double 截断为 long）
    let dd: double = 7.89;
    let de: double = 3.14;
    let tmp: long = 7 & 3;
    assert((dd & de) == tmp, '7.89 & 3.14 should be (7 & 3) = 3');

    // float 与 int 混合
    assert((fa & 5) == 1, '3.14 & 5 should be 1 (3 & 5 = 1)');
    assert((fa | 5) == 7, '3.14 | 5 should be 7 (3 | 5 = 7)');
    assert((fa ^ 5) == 6, '3.14 ^ 5 should be 6 (3 ^ 5 = 6)');

    // double 与 long 混合（使用 long 变量避免 L 后缀）
    let dVal: double = 10.99;
    let l15: long = 15;
    let l10: long = 10;
    assert((dVal & l15) == l10, '10.99 & 15 should be 10 (10 & 15 = 10)');

    console.log('verified');
}
