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
 * @id EXP_07_27_01_018_RUNTIME_MIXED_TYPES
 * @expect runtime
 * @section 7.27.1
 * @design 楠岃瘉娣峰悎鏁板€肩被鍨嬪湪鍏崇郴姣旇緝涓殑鍊兼纭€э紙int+long銆乮nt+float銆乮nt+double銆乴ong+float銆乴ong+double銆乫loat+double锛?
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
  let i: int = 5;
  let l: long = 10;
  let f: float = 5.5f;
  let d: double = 10.5;

  // ===== int < long =====
  assert((i < l) == true, '5 < 10L should be true');
  assert((l < i) == false, '10L < 5 should be false');
  assert((i <= l) == true, '5 <= 10L should be true');
  assert((l >= i) == true, '10L >= 5 should be true');
  // int 涓?long 绛夊€兼瘮杈?
  let i5: int = 5;
  let l5: long = 5;
  assert((i5 <= l5) == true, '5 <= 5L should be true');
  assert((i5 >= l5) == true, '5 >= 5L should be true');
  assert((i5 < l5) == false, '5 < 5L should be false');

  // ===== int < float =====
  assert((i < f) == true, '5 < 5.5f should be true');
  assert((f < i) == false, '5.5f < 5 should be false');
  assert((i > f) == false, '5 > 5.5f should be false');
  assert((f > i) == true, '5.5f > 5 should be true');

  // ===== int < double =====
  assert((i < d) == true, '5 < 10.5 should be true');
  assert((d < i) == false, '10.5 < 5 should be false');
  assert((i <= d) == true, '5 <= 10.5 should be true');
  assert((d >= i) == true, '10.5 >= 5 should be true');

  // ===== long < float =====
  let lSmall: long = 3;
  let fSmall: float = 3.0f;
  assert((lSmall <= fSmall) == true, '3L <= 3.0f should be true');
  assert((lSmall >= fSmall) == true, '3L >= 3.0f should be true');
  assert((lSmall < f) == true, '3L < 5.5f should be true');

  // ===== long < double =====
  assert((lSmall < d) == true, '3L < 10.5 should be true');
  assert((l < d) == true, '10L < 10.5 should be true (10.0 < 10.5)');
  assert((l > d) == false, '10L > 10.5 should be false');

  // ===== float < double锛堜娇鐢ㄧ簿纭彲琛ㄧず鐨勫€奸伩鍏嶇簿搴﹂棶棰橈級=====
  let halfF: float = 1.5f;
  let halfD: double = 1.5;
  assert((halfF <= halfD) == true, '1.5f <= 1.5 should be true');
  assert((halfF >= halfD) == true, '1.5f >= 1.5 should be true');
  assert((halfF < halfD) == false, '1.5f < 1.5 should be false');

  // int 涓?double 甯︾簿搴︽瘮杈?
  assert((1 < 1.5) == true, '1 < 1.5 should be true');
  assert((2 <= 1.0) == false, '2 <= 1.0 should be false (spec example)');

  console.log('verified');
}
