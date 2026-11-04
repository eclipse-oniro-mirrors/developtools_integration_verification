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
 * @id EXP_07_27_06_023_RUNTIME_STRING_ORDER
 * @expect runtime
 * @section 7.27.6
 * @design 验证 string 基类型枚举成员的关系运算符运行时行为（12 断言）
 * @note 运行时用例：string 基类型枚举基于成员字符串值的字典序比较
 *       A="apple", B="banana", C="cherry", D="date"
 *       "apple" < "banana" < "cherry" < "date"
 */
enum StrEnum: string { A = 'apple', B = 'banana', C = 'cherry', D = 'date' }

function main(): void {
    // === < 运算符（3 组合）===
    if (StrEnum.A < StrEnum.B != true) {
    throw new Error('FAIL: 'apple' < 'banana' should be true');
  }
  }
  }
  } }
    if (StrEnum.B < StrEnum.D != true) {
    throw new Error('FAIL: 'banana' < 'date' should be true');
  }
  }
  }
  } }
    if (StrEnum.C < StrEnum.A != false) {
    throw new Error('FAIL: 'cherry' < 'apple' should be false');
  }
  }
  }
  } }

    // === <= 运算符（3 组合）===
    if (StrEnum.A <= StrEnum.A != true) {
    throw new Error('FAIL: 'apple' <= 'apple' should be true');
  }
  }
  }
  } }
    if (StrEnum.A <= StrEnum.C != true) {
    throw new Error('FAIL: 'apple' <= 'cherry' should be true');
  }
  }
  }
  } }
    if (StrEnum.D <= StrEnum.A != false) {
    throw new Error('FAIL: 'date' <= 'apple' should be false');
  }
  }
  }
  } }

    // === > 运算符（3 组合）===
    if (StrEnum.D > StrEnum.A != true) {
    throw new Error('FAIL: 'date' > 'apple' should be true');
  }
  }
  }
  } }
    if (StrEnum.B > StrEnum.D != false) {
    throw new Error('FAIL: 'banana' > 'date' should be false');
  }
  }
  }
  } }
    if (StrEnum.C > StrEnum.B != true) {
    throw new Error('FAIL: 'cherry' > 'banana' should be true');
  }
  }
  }
  } }

    // === >= 运算符（3 组合）===
    if (StrEnum.C >= StrEnum.C != true) {
    throw new Error('FAIL: 'cherry' >= 'cherry' should be true');
  }
  }
  }
  } }
    if (StrEnum.A >= StrEnum.A != true) {
    throw new Error('FAIL: 'apple' >= 'apple' should be true');
  }
  }
  }
  } }
    if (StrEnum.B >= StrEnum.D != false) {
    throw new Error('FAIL: 'banana' >= 'date' should be false');
  }
  }
  }
  } }
console.log('verified');
}
