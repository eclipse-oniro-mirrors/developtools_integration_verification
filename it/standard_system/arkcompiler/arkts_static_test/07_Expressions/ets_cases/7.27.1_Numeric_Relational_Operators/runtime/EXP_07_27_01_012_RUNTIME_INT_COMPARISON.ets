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
 * @id EXP_07_27_01_012_RUNTIME_INT_COMPARISON
 * @expect runtime
 * @section 7.27.1
 * @design 楠岃瘉 int 绫诲瀷 <, <=, >, >= 鍥涗釜鍏崇郴杩愮畻绗︾殑鍩烘湰鍊兼纭€?
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
  // < 杩愮畻绗?
  assert((5 < 10) == true, '5 < 10 should be true');
  assert((10 < 5) == false, '10 < 5 should be false');
  assert((-3 < 0) == true, "-3 < 0 should be true");
  assert((0 < -3) == false, '0 < -3 should be false');

  // <= 杩愮畻绗?
  assert((5 <= 10) == true, '5 <= 10 should be true');
  assert((5 <= 5) == true, '5 <= 5 should be true');
  assert((10 <= 5) == false, '10 <= 5 should be false');
  assert((-1 <= 0) == true, "-1 <= 0 should be true");

  // > 杩愮畻绗?
  assert((5 > 10) == false, '5 > 10 should be false');
  assert((10 > 5) == true, '10 > 5 should be true');
  assert((-1 > -2) == true, "-1 > -2 should be true");
  assert((0 > -1) == true, '0 > -1 should be true');

  // >= 杩愮畻绗?
  assert((5 >= 10) == false, '5 >= 10 should be false');
  assert((5 >= 5) == true, '5 >= 5 should be true');
  assert((10 >= 5) == true, '10 >= 5 should be true');
  assert((-1 >= -1) == true, "-1 >= -1 should be true");

  // spec example: 1 < -3 // false
  assert((1 < -3) == false, '1 < -3 should be false (spec example)');

  // 鐩哥瓑鍊兼瘮杈?
  assert((0 > 0) == false, '0 > 0 should be false');
  assert((0 < 0) == false, '0 < 0 should be false');
  assert((0 >= 0) == true, '0 >= 0 should be true');
  assert((0 <= 0) == true, '0 <= 0 should be true');

  console.log('verified');
}
