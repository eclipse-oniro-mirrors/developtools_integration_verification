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
 * @id EXP_07_27_01_014_RUNTIME_LONG_COMPARISON
 * @expect runtime
 * @section 7.27.1
 * @design 楠岃瘉 long 绫诲瀷 <, <=, >, >= 鍥涗釜鍏崇郴杩愮畻绗︾殑鍩烘湰鍊兼纭€?
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
  let a: long = 5;
  let b: long = 10;
  let zero: long = 0;
  let neg: long = -5;

  // < 杩愮畻绗?
  assert((a < b) == true, '5L < 10L should be true');
  assert((b < a) == false, '10L < 5L should be false');
  assert((neg < zero) == true, "-5L < 0L should be true");
  assert((zero < neg) == false, '0L < -5L should be false');

  // <= 杩愮畻绗?
  assert((a <= b) == true, '5L <= 10L should be true');
  assert((a <= a) == true, '5L <= 5L should be true');
  assert((b <= a) == false, '10L <= 5L should be false');
  assert((neg <= zero) == true, "-5L <= 0L should be true");

  // > 杩愮畻绗?
  assert((a > b) == false, '5L > 10L should be false');
  assert((b > a) == true, '10L > 5L should be true');
  assert((neg > neg) == false, "-5L > -5L should be false");

  // >= 杩愮畻绗?
  assert((a >= b) == false, '5L >= 10L should be false');
  assert((a >= a) == true, '5L >= 5L should be true');
  assert((b >= a) == true, '10L >= 5L should be true');
  assert((neg >= neg) == true, "-5L >= -5L should be true");

  // spec example: -1 as long >= -1 as short // true
  assert((-1 as long >= -1 as short) == true, "-1L >= -1S should be true (spec example)");

  // long 澶ф暟姣旇緝
  let big: long = 9223372036854775807 as long - 1;
  assert((big > 0) == true, 'big long > 0 should be true');

  // long 璐熸暟杈圭晫
  let minLong: long = -9223372036854775807 as long - 1;
  assert((minLong < 0) == true, 'MIN_LONG < 0 should be true');
  assert((minLong < big) == true, 'MIN_LONG < MAX_LONG-1 should be true');

  console.log('verified');
}
