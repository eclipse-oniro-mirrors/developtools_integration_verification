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
 * @id EXP_07_27_06_024_RUNTIME_BYTE_ORDER
 * @expect runtime
 * @section 7.27.6
 * @design 验证 byte 基类型枚举成员的关系运算符运行时行为（12 断言）
 * @note 运行时用例：byte 基类型枚举基于显式 byte 值的数值比较
 *       A=10, B=20, C=30, D=40
 */
enum ByteEnum: byte { A = 10, B = 20, C = 30, D = 40 }

function main(): void {
    // === < 运算符（3 组合）===
    if (ByteEnum.A < ByteEnum.B != true) {
    throw new Error('FAIL: A(10) < B(20) should be true');
  }
  }
  }
  } }
    if (ByteEnum.B < ByteEnum.D != true) {
    throw new Error('FAIL: B(20) < D(40) should be true');
  }
  }
  }
  } }
    if (ByteEnum.D < ByteEnum.A != false) {
    throw new Error('FAIL: D(40) < A(10) should be false');
  }
  }
  }
  } }

    // === <= 运算符（3 组合）===
    if (ByteEnum.A <= ByteEnum.A != true) {
    throw new Error('FAIL: A(10) <= A(10) should be true');
  }
  }
  }
  } }
    if (ByteEnum.A <= ByteEnum.C != true) {
    throw new Error('FAIL: A(10) <= C(30) should be true');
  }
  }
  }
  } }
    if (ByteEnum.D <= ByteEnum.A != false) {
    throw new Error('FAIL: D(40) <= A(10) should be false');
  }
  }
  }
  } }

    // === > 运算符（3 组合）===
    if (ByteEnum.D > ByteEnum.A != true) {
    throw new Error('FAIL: D(40) > A(10) should be true');
  }
  }
  }
  } }
    if (ByteEnum.B > ByteEnum.D != false) {
    throw new Error('FAIL: B(20) > D(40) should be false');
  }
  }
  }
  } }
    if (ByteEnum.C > ByteEnum.B != true) {
    throw new Error('FAIL: C(30) > B(20) should be true');
  }
  }
  }
  } }

    // === >= 运算符（3 组合）===
    if (ByteEnum.C >= ByteEnum.C != true) {
    throw new Error('FAIL: C(30) >= C(30) should be true');
  }
  }
  }
  } }
    if (ByteEnum.A >= ByteEnum.A != true) {
    throw new Error('FAIL: A(10) >= A(10) should be true');
  }
  }
  }
  } }
    if (ByteEnum.B >= ByteEnum.D != false) {
    throw new Error('FAIL: B(20) >= D(40) should be false');
  }
  }
  }
  } }
console.log('verified');
}
