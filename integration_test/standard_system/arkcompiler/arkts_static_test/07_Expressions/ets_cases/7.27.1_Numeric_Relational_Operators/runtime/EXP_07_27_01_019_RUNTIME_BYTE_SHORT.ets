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
 * @id EXP_07_27_01_019_RUNTIME_BYTE_SHORT
 * @expect runtime
 * @section 7.27.1
 * @design 楠岃瘉 byte/short 绫诲瀷鍦ㄥ叧绯绘瘮杈冧腑鎻愬崌涓?int 鍚庣殑鍊兼纭€?
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
  let a: byte = 5;
  let b: byte = 10;
  let c: short = 5;
  let d: short = 10;

  // byte < byte
  assert((a < b) == true, 'byte 5 < 10 should be true');
  assert((b < a) == false, 'byte 10 < 5 should be false');
  assert((a <= b) == true, 'byte 5 <= 10 should be true');
  assert((a <= a) == true, 'byte 5 <= 5 should be true');

  // short < short
  assert((c < d) == true, 'short 5 < 10 should be true');
  assert((d < c) == false, 'short 10 < 5 should be false');
  assert((c <= c) == true, 'short 5 <= 5 should be true');

  // byte 涓?short 娣峰悎
  assert((a < d) == true, 'byte 5 < short 10 should be true');
  assert((c > b) == false, 'short 5 > byte 10 should be false');
  assert((a >= c) == true, 'byte 5 >= short 5 should be true');

  // byte 涓?int 娣峰悎
  assert((a < 10) == true, 'byte 5 < int 10 should be true');
  assert((a > -1) == true, 'byte 5 > int -1 should be true');
  assert((a <= 5) == true, 'byte 5 <= int 5 should be true');

  // short 涓?int 娣峰悎
  assert((c <= 10) == true, 'short 5 <= int 10 should be true');
  assert((-1 as short < 0) == true, 'short -1 < int 0 should be true');

  // byte/short 璐熸暟姣旇緝
  let negByte: byte = -5;
  let negShort: short = -10;
  assert((negByte < 0) == true, 'byte -5 < 0 should be true');
  assert((negShort < negByte) == true, 'short -10 < byte -5 should be true');
  assert((negByte > negShort) == true, 'byte -5 > short -10 should be true');

  console.log('verified');
}
