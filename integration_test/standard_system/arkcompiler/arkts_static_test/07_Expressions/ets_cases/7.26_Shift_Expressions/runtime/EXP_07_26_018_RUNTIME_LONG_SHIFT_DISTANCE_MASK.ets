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
 * @id EXP_07_26_018_RUNTIME_LONG_SHIFT_DISTANCE_MASK
 * @expect runtime
 * @section 7.26
 * @design long 绫诲瀷绉讳綅璺濈鎺╃爜楠岃瘉锛氬彧鍙栧彸鎿嶄綔鏁颁綆 6 浣嶏紙0x3f锛?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 long 绉讳綅鏃惰窛绂昏鎺╃爜涓?0~63
 *       s & 0x3f锛歴=64 鈫?s=0锛宻=65 鈫?s=1
 *       ArkTS 涓嶆敮鎸?L 鍚庣紑锛屼娇鐢?long 鍙橀噺瀹炵幇
 */
function main(): void {
    let a1: long = 1;
    let a64: long = 64;
    let a65: long = 65;
    let a3: long = 3;
    let a63: long = 63;
    let dist: long = 64;

    // 1L << 64 = 1L << 0锛?4 & 0x3f = 0锛?
    if ((a1 << a64) != (a1 << 0)) {
        throw new Error('assert1 failed: 1L << 64 != 1L << 0, got ' + (a1 << a64));
    }
    // 1L << 65 = 1L << 1锛?5 & 0x3f = 1锛?
    if ((a1 << a65) != (a1 << a1)) {
        throw new Error('assert2 failed: 1L << 65 != 1L << 1, got ' + (a1 << a65));
    }
    // 3L << 63锛堢鍙蜂綅缈昏浆锛?
    if ((a3 << a63) != (a1 << a63)) {
        let minLongResult: long = a3 << a63;
        throw new Error('assert3 failed: 3L << 63 != MIN_LONG, got ' + minLongResult);
    }
    // 1L << 0 = 1L锛堥浂绉讳綅锛?
    if ((a1 << 0) != a1) {
        throw new Error('assert4 failed: 1L << 0 != 1L');
    }
    // 鐢ㄥ彉閲忛獙璇佹帺鐮?
    if ((a1 << dist) != a1) {
        throw new Error('assert5 failed: 1L << 64 != 1L (variable), got ' + (a1 << dist));
    }
console.log('verified');
}
