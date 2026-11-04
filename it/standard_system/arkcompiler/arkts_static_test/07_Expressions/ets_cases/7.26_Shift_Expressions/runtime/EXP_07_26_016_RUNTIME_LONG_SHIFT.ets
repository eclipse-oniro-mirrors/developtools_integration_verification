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
 * @id EXP_07_26_016_RUNTIME_LONG_SHIFT
 * @expect runtime
 * @section 7.26
 * @design long 绫诲瀷涓変釜绉讳綅杩愮畻绗︼紙<<, >>, >>>锛夌殑杩愯鏃跺€奸獙璇?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 long 绫诲瀷绉讳綅姝ｇ‘鍊?
 *       ArkTS 涓嶆敮鎸?Java 椋庢牸鐨?L 鍚庣紑锛屼娇鐢?long 鍙橀噺瀹炵幇
 */
function main(): void {
    let a5: long = 5;
    let a20: long = 20;
    let a2: long = 2;
    let a1: long = 1;
    let n20: long = -20;
    let n1: long = -1;
    let a100: long = 100;
    let a25: long = 25;
    let a63: long = 63;

    // long <<
    if ((a5 << a2) != a20) {
        throw new Error('assert1 failed: 5L << 2 != 20L, got ' + (a5 << a2));
    }
    // long >> 绗﹀彿鎵╁睍锛?20 >> 2 = -5
    if ((n20 >> a2) != -5) {
        throw new Error('assert2 failed: -20L >> 2 != -5L, got ' + (n20 >> a2));
    }
    // -1 >> 63 = -1锛堢鍙锋墿灞曟墍鏈変綅锛?
    if ((n1 >> a63) != n1) {
        throw new Error('assert3 failed: -1L >> 63 != -1L, got ' + (n1 >> a63));
    }
    // -1 >>> 63 = 1锛堥浂鎵╁睍锛屽彧鏈夌鍙蜂綅鍙?1锛?
    if ((n1 >>> a63) != a1) {
        throw new Error('assert4 failed: -1L >>> 63 != 1L, got ' + (n1 >>> a63));
    }
    // long 姝ｆ暟 >>> 鍚?>>
    if ((a100 >>> a2) != a25) {
        throw new Error('assert5 failed: 100L >>> 2 != 25L');
    }
console.log('verified');
}
