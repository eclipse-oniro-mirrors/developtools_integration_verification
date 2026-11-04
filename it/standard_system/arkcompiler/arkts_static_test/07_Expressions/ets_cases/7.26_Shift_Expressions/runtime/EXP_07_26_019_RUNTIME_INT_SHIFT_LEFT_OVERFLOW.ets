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
 * @id EXP_07_26_019_RUNTIME_INT_SHIFT_LEFT_OVERFLOW
 * @expect runtime
 * @section 7.26
 * @design int 宸︾Щ婧㈠嚭琛屼负楠岃瘉锛氱瓑浠蜂簬涔樹互 2^s锛屽嵆浣挎孩鍑轰篃鎸変箻娉曠瓑鏁?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 int << s 婧㈠嚭鏃剁殑浜岃繘鍒惰ˉ鐮佹埅鏂涓?
 *       瑙勫垯锛歯 << s 绛変环浜?n * 2^s锛屽嵆浣挎孩鍑轰篃鎸変簩杩涘埗琛ョ爜鎴柇
 */
function main(): void {
    // 1 << 31 = -2147483648锛圡IN_INT锛氱鍙蜂綅琚疆 1锛?
    if ((1 << 31) != -2147483648) {
        throw new Error('assert1 failed: 1 << 31 != MIN_INT, got ' + (1 << 31));
    }
    // -1 << 31 = -2147483648锛?1 * 2^31 鎴柇锛?
    if ((-1 << 31) != -2147483648) {
        throw new Error('assert2 failed: -1 << 31 != MIN_INT, got ' + (-1 << 31));
    }
    // 0x7fffffff << 1 = -2锛圡AX_INT 宸︾Щ 1 浣嶆孩鍑猴級
    let max: int = 2147483647;
    if ((max << 1) != -2) {
        throw new Error('assert3 failed: MAX_INT << 1 != -2, got ' + (max << 1));
    }
    // 3 << 30 = -1073741824锛? * 2^30 婧㈠嚭鍒拌礋锛?
    if ((3 << 30) != -1073741824) {
        throw new Error('assert4 failed: 3 << 30 != -1073741824, got ' + (3 << 30));
    }
    // 鏃犳孩鍑猴細5 << 27 = 671088640锛堝湪 int 鑼冨洿鍐咃級
    if ((5 << 27) != 671088640) {
        throw new Error('assert5 failed: 5 << 27 != 671088640, got ' + (5 << 27));
    }
console.log('verified');
}
