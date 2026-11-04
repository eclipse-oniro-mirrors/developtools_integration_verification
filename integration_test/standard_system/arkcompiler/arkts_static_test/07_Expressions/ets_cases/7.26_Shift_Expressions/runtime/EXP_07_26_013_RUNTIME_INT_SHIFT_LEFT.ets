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
 * @id EXP_07_26_013_RUNTIME_INT_SHIFT_LEFT
 * @expect runtime
 * @section 7.26
 * @design int 绫诲瀷宸︾Щ << 鐨勮繍琛屾椂鍊奸獙璇?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 int << s 鐨勬纭€?
 *       瑙勫垯锛歯 << s = n * 2^s锛堝嵆浣挎孩鍑轰篃鎸変箻娉曠瓑鏁堬級
 */
function main(): void {
    // 5 << 2 = 20锛? * 4锛?
    if ((5 << 2) != 20) {
        throw new Error('assert1 failed: 5 << 2 != 20, got ' + (5 << 2));
    }
    // 0 << 5 = 0
    if ((0 << 5) != 0) {
        throw new Error('assert2 failed: 0 << 5 != 0');
    }
    // -3 << 2 = -12锛?3 * 4锛?
    if ((-3 << 2) != -12) {
        throw new Error('assert3 failed: -3 << 2 != -12, got ' + (-3 << 2));
    }
    // 1 << 0 = 1锛堥浂绉讳綅锛?
    if ((1 << 0) != 1) {
        throw new Error('assert4 failed: 1 << 0 != 1');
    }
    // 鍙橀噺绉讳綅
    let a: int = 10;
    let b: int = 3;
    if ((a << b) != 80) {
        throw new Error('assert5 failed: 10 << 3 != 80, got ' + (a << b));
    }
console.log('verified');
}
