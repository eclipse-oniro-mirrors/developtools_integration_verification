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
 * @id EXP_07_26_021_RUNTIME_SHIFT_NEGATIVE_DISTANCE
 * @expect runtime
 * @section 7.26
 * @design 璐熺Щ浣嶈窛绂诲湪鎺╃爜鍚庡彉涓烘鏁拌窛绂荤殑楠岃瘉
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉璐熺Щ浣嶈窛绂昏鎺╃爜鍙栦綆 5/6 浣嶅悗鍙樹负 [0, 31]/[0, 63]
 *       int锛歴 & 0x1f锛坰=-1 -> 31, s=-2 -> 30锛?
 *       long锛歴 & 0x3f锛坰=-1 -> 63, s=-2 -> 62锛?
 *       ArkTS 涓嶆敮鎸?L 鍚庣紑锛屼娇鐢?long 鍙橀噺瀹炵幇
 */
function main(): void {
    // int: -1 & 0x1f = 31锛屾墍浠?1 << -1 = 1 << 31 = MIN_INT
    if ((1 << -1) != (1 << 31)) {
        throw new Error('assert1 failed: 1 << -1 != 1 << 31, got ' + (1 << -1));
    }
    // int: -2 & 0x1f = 30锛屾墍浠?1 << -2 = 1 << 30 = 1073741824
    if ((1 << -2) != 1073741824) {
        throw new Error('assert2 failed: 1 << -2 != 1<<30, got ' + (1 << -2));
    }
    // int: 10 >> -1 = 10 >> 31 = 0锛堟鏁板彸绉?31 浣嶏級
    if ((10 >> -1) != 0) {
        throw new Error('assert3 failed: 10 >> -1 != 0, got ' + (10 >> -1));
    }
    // long: 1 << -1 = 1 << 63
    let a1: long = 1;
    let minLong: long = a1 << 63;
    if ((a1 << -1) != minLong) {
        throw new Error('assert4 failed: 1L << -1 != MIN_LONG, got ' + (a1 << -1));
    }
    // long: 1 << -2 = 1 << 62
    let v62: long = a1 << 62;
    if ((a1 << -2) != v62) {
        throw new Error('assert5 failed: 1L << -2 != 1L<<62, got ' + (a1 << -2));
    }
console.log('verified');
}
