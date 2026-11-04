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
 * @id EXP_07_26_014_RUNTIME_INT_SIGNED_RIGHT
 * @expect runtime
 * @section 7.26
 * @design int 绫诲瀷甯︾鍙峰彸绉?>> 鐨勮繍琛屾椂鍊奸獙璇?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 int >> s 鐨勭鍙锋墿灞曡涓?
 *       瑙勫垯锛歯 >> s = floor(n / 2^s)锛岀鍙蜂綅琚鍒?
 */
function main(): void {
    // 20 >> 2 = 5锛?0 / 4锛?
    if ((20 >> 2) != 5) {
        throw new Error('assert1 failed: 20 >> 2 != 5, got ' + (20 >> 2));
    }
    // -20 >> 2 = -5锛?20 / 4 = -5锛屽悜涓嬪彇鏁达級
    if ((-20 >> 2) != -5) {
        throw new Error('assert2 failed: -20 >> 2 != -5, got ' + (-20 >> 2));
    }
    // -1 >> 1 = -1锛堢鍙锋墿灞曪紝濮嬬粓淇濇寔 -1锛?
    if ((-1 >> 1) != -1) {
        throw new Error('assert3 failed: -1 >> 1 != -1, got ' + (-1 >> 1));
    }
    // -1 >> 31 = -1锛堢鍙锋墿灞曞埌鎵€鏈変綅锛?
    if ((-1 >> 31) != -1) {
        throw new Error('assert4 failed: -1 >> 31 != -1, got ' + (-1 >> 31));
    }
    // 姝ｆ暟 >> s锛氱瓑浠蜂簬鏁存暟闄ゆ硶
    if ((7 >> 2) != 1) {
        throw new Error('assert5 failed: 7 >> 2 != 1, got ' + (7 >> 2));
    }
    // 100 >> 0 = 100锛堥浂绉伙級
    if ((100 >> 0) != 100) {
        throw new Error('assert6 failed: 100 >> 0 != 100');
    }
console.log('verified');
}
