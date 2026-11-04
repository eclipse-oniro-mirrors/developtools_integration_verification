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
 * @id EXP_07_27_06_022_RUNTIME_LONG_ORDER
 * @expect runtime
 * @section 7.27.6
 * @design 验证 long 基类型枚举成员的关系运算符运行时行为（12 断言）
 * @note 运行时用例：long 基类型枚举基于显式 long 值的数值比较
 *       A=100, B=200, C=300, D=400
 */
enum LongEnum: long { A = 100, B = 200, C = 300, D = 400 }

function main(): void {
    // === < 运算符（3 组合）===
    if (LongEnum.A < LongEnum.B != true) {
    throw new Error('FAIL: A(100) < B(200) should be true');
  }
  }
  }
  } }
    if (LongEnum.B < LongEnum.D != true) {
    throw new Error('FAIL: B(200) < D(400) should be true');
  }
  }
  }
  } }
    if (LongEnum.D < LongEnum.A != false) {
    throw new Error('FAIL: D(400) < A(100) should be false');
  }
  }
  }
  } }

    // === <= 运算符（3 组合）===
    if (LongEnum.A <= LongEnum.A != true) {
    throw new Error('FAIL: A(100) <= A(100) should be true');
  }
  }
  }
  } }
    if (LongEnum.A <= LongEnum.C != true) {
    throw new Error('FAIL: A(100) <= C(300) should be true');
  }
  }
  }
  } }
    if (LongEnum.D <= LongEnum.A != false) {
    throw new Error('FAIL: D(400) <= A(100) should be false');
  }
  }
  }
  } }

    // === > 运算符（3 组合）===
    if (LongEnum.D > LongEnum.A != true) {
    throw new Error('FAIL: D(400) > A(100) should be true');
  }
  }
  }
  } }
    if (LongEnum.B > LongEnum.D != false) {
    throw new Error('FAIL: B(200) > D(400) should be false');
  }
  }
  }
  } }
    if (LongEnum.C > LongEnum.B != true) {
    throw new Error('FAIL: C(300) > B(200) should be true');
  }
  }
  }
  } }

    // === >= 运算符（3 组合）===
    if (LongEnum.C >= LongEnum.C != true) {
    throw new Error('FAIL: C(300) >= C(300) should be true');
  }
  }
  }
  } }
    if (LongEnum.A >= LongEnum.A != true) {
    throw new Error('FAIL: A(100) >= A(100) should be true');
  }
  }
  }
  } }
    if (LongEnum.B >= LongEnum.D != false) {
    throw new Error('FAIL: B(200) >= D(400) should be false');
  }
  }
  }
  } }
console.log('verified');
}
