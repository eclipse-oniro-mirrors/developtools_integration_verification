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
 * @id EXP_07_27_01_016_RUNTIME_DOUBLE_COMPARISON
 * @expect runtime
 * @section 7.27.1
 * @design 楠岃瘉 double 绫诲瀷 <, <=, >, >= 鍥涗釜鍏崇郴杩愮畻绗︾殑鍩烘湰鍊兼纭€?
 *  * @note 杩愯鏃剁敤渚嬶細楠岃瘉璇ュ満鏅殑杩愯鏃惰涓? */
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
  let a: double = 1.5;
  let b: double = 2.5;
  let zero: double = 0.0;
  let neg: double = -1.5;

  // < 杩愮畻绗?
  assert((a < b) == true, '1.5 < 2.5 should be true');
  assert((b < a) == false, '2.5 < 1.5 should be false');
  assert((neg < zero) == true, "-1.5 < 0.0 should be true");
  assert((zero < neg) == false, '0.0 < -1.5 should be false');

  // <= 杩愮畻绗?
  assert((a <= b) == true, '1.5 <= 2.5 should be true');
  assert((a <= a) == true, '1.5 <= 1.5 should be true');
  assert((b <= a) == false, '2.5 <= 1.5 should be false');
  assert((neg <= zero) == true, "-1.5 <= 0.0 should be true");

  // > 杩愮畻绗?
  assert((a > b) == false, '1.5 > 2.5 should be false');
  assert((b > a) == true, '2.5 > 1.5 should be true');
  assert((neg > neg) == false, "-1.5 > -1.5 should be false");
  assert((zero > neg) == true, '0.0 > -1.5 should be true');

  // >= 杩愮畻绗?
  assert((a >= b) == false, '1.5 >= 2.5 should be false');
  assert((a >= a) == true, '1.5 >= 1.5 should be true');
  assert((b >= a) == true, '2.5 >= 1.5 should be true');
  assert((neg >= neg) == true, "-1.5 >= -1.5 should be true");

  // spec example: 2 <= 1.0 // false
  assert((2 <= 1.0) == false, '2 <= 1.0 should be false (spec example)');

  // double 灏忔暟绮惧害姣旇緝
  let pi: double = 3.14159265358979;
  let e: double = 2.71828182845905;
  assert((e < pi) == true, 'e < pi should be true');
  assert((pi > e) == true, 'pi > e should be true');

  // 鏋佸ぇ鏋佸皬 double 鍊?
  let tiny: double = 1e-300;
  let huge: double = 1e300;
  assert((tiny < huge) == true, '1e-300 < 1e300 should be true');
  assert((huge > tiny) == true, '1e300 > 1e-300 should be true');
  assert((-tiny > -huge) == true, "-1e-300 > -1e300 should be true");

  console.log('verified');
}
