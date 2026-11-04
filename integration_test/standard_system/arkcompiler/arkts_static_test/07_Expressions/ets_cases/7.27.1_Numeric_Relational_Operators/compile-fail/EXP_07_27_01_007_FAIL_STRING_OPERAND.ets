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
 * @id EXP_07_27_01_007_FAIL_STRING_OPERAND
 * @expect compile-fail
 * @section 7.27.1
 * @design 楠岃瘉 string 绫诲瀷鎿嶄綔鏁颁笌 int 杩涜 < 姣旇緝鏃朵骇鐢熺紪璇戞椂閿欒
 *  * @note 鍙嶅悜鐢ㄤ緥锛氶獙璇佽鍦烘櫙搴斾骇鐢熺紪璇戞椂閿欒
 */
function main(): void {
  let s: string = 'hello';
  let n: int = 5;
  let r: boolean = s < n; // compile-time error: string not numeric
}
