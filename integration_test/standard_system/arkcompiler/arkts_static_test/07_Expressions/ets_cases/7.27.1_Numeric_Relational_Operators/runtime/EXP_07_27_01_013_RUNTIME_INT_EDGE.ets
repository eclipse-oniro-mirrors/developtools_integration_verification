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
 * @id EXP_07_27_01_013_RUNTIME_INT_EDGE
 * @expect runtime
 * @section 7.27.1
 * @design 楠岃瘉 int 绫诲瀷杈圭晫鍊硷紙MAX_VALUE銆丮IN_VALUE銆佽礋鏁拌竟鐣岋級鐨勫叧绯绘瘮杈?
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
  let maxInt: int = 2147483647;
  let minInt: int = -2147483647 - 1;

  // INT_MAX 姣旇緝
  assert((maxInt > 0) == true, 'INT_MAX > 0 should be true');
  assert((maxInt < 2147483647) == false, 'INT_MAX < INT_MAX should be false');
  assert((maxInt <= 2147483647) == true, 'INT_MAX <= INT_MAX should be true');
  assert((maxInt >= 2147483647) == true, 'INT_MAX >= INT_MAX should be true');
  assert((maxInt > 2147483646) == true, 'INT_MAX > INT_MAX-1 should be true');
  assert((2147483646 < maxInt) == true, 'INT_MAX-1 < INT_MAX should be true');

  // INT_MIN 姣旇緝
  assert((minInt < 0) == true, 'INT_MIN < 0 should be true');
  assert((minInt > -2147483647 - 1) == false, 'INT_MIN < INT_MIN should be false');
  assert((minInt <= -2147483647 - 1) == true, 'INT_MIN <= INT_MIN should be true');
  assert((minInt >= -2147483647 - 1) == true, 'INT_MIN >= INT_MIN should be true');
  assert((minInt < -2147483647) == true, 'INT_MIN < INT_MIN+1 should be true');

  // INT_MIN vs INT_MAX
  assert((minInt < maxInt) == true, 'INT_MIN < INT_MAX should be true');
  assert((maxInt > minInt) == true, 'INT_MAX > INT_MIN should be true');
  assert((minInt <= maxInt) == true, 'INT_MIN <= INT_MAX should be true');
  assert((maxInt >= minInt) == true, 'INT_MAX >= INT_MIN should be true');

  // 澶ц礋鏁版瘮杈?
  assert((-1000000 < 0) == true, "-1M < 0 should be true");
  assert((-1000000 > -2000000) == true, "-1M > -2M should be true");

  console.log('verified');
}
