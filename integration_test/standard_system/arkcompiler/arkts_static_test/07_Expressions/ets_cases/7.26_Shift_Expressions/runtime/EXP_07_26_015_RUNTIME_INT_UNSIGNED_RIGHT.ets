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
 * @id EXP_07_26_015_RUNTIME_INT_UNSIGNED_RIGHT
 * @expect runtime
 * @section 7.26
 * @design int 绫诲瀷鏃犵鍙峰彸绉?>>> 鐨勮繍琛屾椂鍊奸獙璇?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 int >>> s 鐨勯浂鎵╁睍琛屼负
 *       姝ｆ暟鍚?>>锛涜礋鏁伴珮浣嶈ˉ 0锛堝彉鎴愭鏁帮級
 */
function main(): void {
    // 姝ｆ暟 >>> 绛変环浜?>>
    if ((20 >>> 2) != 5) {
        throw new Error('assert1 failed: 20 >>> 2 != 5, got ' + (20 >>> 2));
    }
    // -1 >>> 31 = 1锛堝彧鏈夌鍙蜂綅鍙樻锛?
    if ((-1 >>> 31) != 1) {
        throw new Error('assert2 failed: -1 >>> 31 != 1, got ' + (-1 >>> 31));
    }
    // -1 >>> 1 = 2147483647锛堥珮浣嶈ˉ 0锛?
    if ((-1 >>> 1) != 2147483647) {
        throw new Error('assert3 failed: -1 >>> 1 != 2147483647, got ' + (-1 >>> 1));
    }
    // 姝ｆ暟闆舵墿灞曟亽绛変簬姝ｆ暟
    if ((5 >>> 0) != 5) {
        throw new Error('assert4 failed: 5 >>> 0 != 5');
    }
    // -2147483648 >>> 31 = 1锛圡IN_INT 鏃犵鍙峰彸绉?31 浣嶏級
    let min: int = -2147483647 - 1;
    if ((min >>> 31) != 1) {
        throw new Error('assert5 failed: MIN_INT >>> 31 != 1, got ' + (min >>> 31));
    }
console.log('verified');
}
