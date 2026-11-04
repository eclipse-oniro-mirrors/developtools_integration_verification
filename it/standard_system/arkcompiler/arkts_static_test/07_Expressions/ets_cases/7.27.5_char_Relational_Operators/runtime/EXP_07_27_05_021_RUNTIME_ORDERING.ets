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
 * @id EXP_07_27_05_021_RUNTIME_ORDERING
 * @expect runtime
 * @section 7.27.5
 * @design 验证 char 字符序：ASCII 字母/数字的大小关系，4 运算符 × 4 组合（16 断言）
 *  * @note 运行时用例：验证该场景的运行时行为
 *       '0'(48) < '9'(57) < 'A'(65) < 'Z'(90) < 'a'(97) < 'z'(122)
 */
function main(): void {
    let zero: char = c'0';
    let nine: char = c'9';
    let capA: char = c'A';
    let capZ: char = c'Z';
    let lowA: char = c'a';
    let lowZ: char = c'z';

    // === < 运算符（4 组合）===
    // smaller < larger = true
    if (zero < nine != true) {
    throw new Error('FAIL: '0' < '9' should be true');
  }
  }
  }
  } }
    if (capA < capZ != true) {
    throw new Error('FAIL: 'A' < 'Z' should be true');
  }
  }
  }
  } }
    // larger < smaller = false
    if (nine < zero != false) {
    throw new Error('FAIL: '9' < '0' should be false');
  }
  }
  }
  } }
    if (capZ < capA != false) {
    throw new Error('FAIL: 'Z' < 'A' should be false');
  }
  }
  }
  } }

    // === <= 运算符（4 组合）===
    if (zero <= nine != true) {
    throw new Error('FAIL: '0' <= '9' should be true');
  }
  }
  }
  } }
    if (zero <= zero != true) {
    throw new Error('FAIL: '0' <= '0' should be true');
  }
  }
  }
  } }
    if (nine <= zero != false) {
    throw new Error('FAIL: '9' <= '0' should be false');
  }
  }
  }
  } }
    if (nine <= nine != true) {
    throw new Error('FAIL: '9' <= '9' should be true');
  }
  }
  }
  } }

    // === >= 运算符（4 组合）===
    if (nine >= zero != true) {
    throw new Error('FAIL: '9' >= '0' should be true');
  }
  }
  }
  } }
    if (nine >= nine != true) {
    throw new Error('FAIL: '9' >= '9' should be true');
  }
  }
  }
  } }
    if (zero >= nine != false) {
    throw new Error('FAIL: '0' >= '9' should be false');
  }
  }
  }
  } }
    if (zero >= zero != true) {
    throw new Error('FAIL: '0' >= '0' should be true');
  }
  }
  }
  } }

    // === > 运算符（4 组合）===
    if (nine > zero != true) {
    throw new Error('FAIL: '9' > '0' should be true');
  }
  }
  }
  } }
    if (zero > nine != false) {
    throw new Error('FAIL: '0' > '9' should be false');
  }
  }
  }
  } }
    if (capZ > capA != true) {
    throw new Error('FAIL: 'Z' > 'A' should be true');
  }
  }
  }
  } }
    if (capA > capZ != false) {
    throw new Error('FAIL: 'A' > 'Z' should be false');
  }
  }
  }
  } }
console.log('verified');
}
