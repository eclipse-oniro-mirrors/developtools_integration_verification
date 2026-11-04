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
 * @id EXP_07_27_01_011_FAIL_NON_NUMERIC_BOTH
 * @expect compile-fail
 * @section 7.27.1
 * @design 楠岃瘉鍙屾柟鍧囦负闈炴暟鍊肩被鍨嬶紙string/boolean锛夎繘琛屽叧绯绘瘮杈冩椂浜х敓缂栬瘧鏃堕敊璇?
 *  * @note 鍙嶅悜鐢ㄤ緥锛氶獙璇佽鍦烘櫙搴斾骇鐢熺紪璇戞椂閿欒
 */
function main(): void {
  let s: string = 'hello';
  let b: boolean = true;
  let r: boolean = s < b; // compile-time error: neither operand is numeric
}
