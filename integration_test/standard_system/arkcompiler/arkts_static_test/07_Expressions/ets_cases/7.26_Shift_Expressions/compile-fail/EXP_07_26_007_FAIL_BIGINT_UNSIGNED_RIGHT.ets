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
 * @id EXP_07_26_007_FAIL_BIGINT_UNSIGNED_RIGHT
 * @expect compile-fail
 * @section 7.26
 * @design bigint 绫诲瀷涓嶆敮鎸?>>>锛堟棤绗﹀彿鍙崇Щ锛夛紝搴斾骇鐢熺紪璇戞椂閿欒
 * @note 鍙嶅悜鐢ㄤ緥锛氶獙璇?bigint >>> bigint 琚紪璇戝櫒姝ｇ‘鎷掔粷
 *       Spec 瑙勫畾锛歝ompile-time error if '>>>' is applied to operands of type bigint
 */
function main(): void {
    let a: bigint = 16n;
    let b: bigint = 2n;
    let c: bigint = a >>> b;
    console.log('result: ' + c);
}
