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
 * @id EXP_07_26_011_FAIL_SHIFT_OBJECT
 * @expect compile-fail
 * @section 7.26
 * @design Object 绫诲瀷涓嶈兘鐢ㄤ簬绉讳綅杩愮畻锛屽簲浜х敓缂栬瘧鏃堕敊璇?
 * @note 鍙嶅悜鐢ㄤ緥锛氶獙璇?Object >> int 琚紪璇戝櫒鎷掔粷
 *       Spec 瑙勫畾锛歜oth operands must be of numeric types or type bigint
 */
function main(): void {
    let obj: Object = {};
    let shift: int = 2;
    let c: Object = obj >> shift;
    console.log('result: ' + c);
}
