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
 * @id EXP_07_26_020_RUNTIME_BIGINT_SHIFT
 * @expect runtime
 * @section 7.26
 * @design bigint 绫诲瀷绉讳綅杩愮畻锛?<, >>锛夌殑杩愯鏃跺€奸獙璇?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 bigint << bigint 鍜?bigint >> bigint 鐨勬纭€?
 *       bigint 绉讳綅鏃犺窛绂绘帺鐮侀檺鍒?
 */
function main(): void {
    // 5n << 2n = 20n
    if ((5n << 2n) != 20n) {
        throw new Error('assert1 failed: 5n << 2n != 20n, got ' + (5n << 2n));
    }
    // -3n << 2n = -12n
    if ((-3n << 2n) != -12n) {
        throw new Error('assert2 failed: -3n << 2n != -12n, got ' + (-3n << 2n));
    }
    // 20n >> 2n = 5n锛堟鏁板彸绉伙級
    if ((20n >> 2n) != 5n) {
        throw new Error('assert3 failed: 20n >> 2n != 5n, got ' + (20n >> 2n));
    }
    // -20n >> 2n = -5n锛堣礋鏁板彸绉伙紝鍚戜笅鍙栨暣锛?
    if ((-20n >> 2n) != -5n) {
        throw new Error('assert4 failed: -20n >> 2n != -5n, got ' + (-20n >> 2n));
    }
    // -5n >> 1n = -3n锛?5/2 = -2.5锛屽悜涓嬪彇鏁?鈫?-3锛?
    if ((-5n >> 1n) != -3n) {
        throw new Error('assert5 failed: -5n >> 1n != -3n, got ' + (-5n >> 1n));
    }
    // bigint 宸︾Щ澶ф暟锛?n << 100n = 1267650600228229401496703205376n
    let big: bigint = 1n << 100n;
    if (big != 1267650600228229401496703205376n) {
    throw new Error('assert6 failed: 1n << 100n != 2^100, got ' + big);
  }
  }
  }
  }
    }
console.log('verified');
}
