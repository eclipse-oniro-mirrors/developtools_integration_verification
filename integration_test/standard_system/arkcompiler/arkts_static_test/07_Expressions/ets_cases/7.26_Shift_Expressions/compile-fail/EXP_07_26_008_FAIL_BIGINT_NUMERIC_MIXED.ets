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
 * @id EXP_07_26_008_FAIL_BIGINT_NUMERIC_MIXED
 * @expect compile-fail
 * @section 7.26
 * @design bigint 涓庢暟鍊肩被鍨嬫贩鍚堢敤浜庣Щ浣嶈繍绠楀簲浜х敓缂栬瘧鏃堕敊璇?
 * @note 鍙嶅悜鐢ㄤ緥锛氶獙璇?bigint << int 绛夋贩鍚堢被鍨嬬Щ浣嶈缂栬瘧鍣ㄦ嫆缁?
 *       Spec 瑙勫畾锛歝ompile-time error if one operand is bigint and the other is numeric
 */
function main(): void {
    let a: bigint = 16n;
    let b: int = 2;
    let c: bigint = a << b;
    console.log('result: ' + c);
}
