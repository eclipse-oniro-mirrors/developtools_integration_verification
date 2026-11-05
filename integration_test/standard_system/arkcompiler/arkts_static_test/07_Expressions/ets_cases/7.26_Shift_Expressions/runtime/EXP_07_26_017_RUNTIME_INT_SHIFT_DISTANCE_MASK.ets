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
 * @id EXP_07_26_017_RUNTIME_INT_SHIFT_DISTANCE_MASK
 * @expect runtime
 * @section 7.26
 * @design int 绫诲瀷绉讳綅璺濈鎺╃爜楠岃瘉锛氬彧鍙栧彸鎿嶄綔鏁颁綆 5 浣嶏紙0x1f锛?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 int 绉讳綅鏃惰窛绂昏鎺╃爜涓?0~31
 *       s & 0x1f锛歴=32 鈫?s=0锛宻=33 鈫?s=1锛宻=-1 鈫?s=31
 */
function main(): void {
    // 1 << 32 = 1 << 0锛?2 & 0x1f = 0锛?
    if ((1 << 32) != (1 << 0)) {
        throw new Error('assert1 failed: 1 << 32 != 1 << 0, got ' + (1 << 32));
    }
    // 1 << 33 = 1 << 1锛?3 & 0x1f = 1锛?
    if ((1 << 33) != (1 << 1)) {
        throw new Error('assert2 failed: 1 << 33 != 1 << 1, got ' + (1 << 33));
    }
    // 1 << 16 = 65536锛?6 鍦?0~31 鑼冨洿鍐咃紝鏃犳帺鐮佹晥鏋滐級
    if ((1 << 16) != 65536) {
        throw new Error('assert3 failed: 1 << 16 != 65536, got ' + (1 << 16));
    }
    // 5 << 0 = 5锛堥浂绉讳綅锛?
    if ((5 << 0) != 5) {
        throw new Error('assert4 failed: 5 << 0 != 5');
    }
    // 鐢ㄥ彉閲忛獙璇佹帺鐮?
    let dist: int = 32;
    if ((1 << dist) != 1) {
        throw new Error('assert5 failed: 1 << 32 != 1 (variable), got ' + (1 << dist));
    }
    // 5 << 31 = 5 << (31 & 0x1f) = -2147483648锛堢鍙蜂綅缈昏浆锛?
    if ((5 << 31) != -2147483648) {
        throw new Error('assert6 failed: 5 << 31 != MIN_INT, got ' + (5 << 31));
    }
console.log('verified');
}
