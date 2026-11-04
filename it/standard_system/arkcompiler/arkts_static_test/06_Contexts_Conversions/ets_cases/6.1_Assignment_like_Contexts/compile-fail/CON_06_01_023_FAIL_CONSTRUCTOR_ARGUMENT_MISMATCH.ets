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
 * @id CON_06_01_023_FAIL_CONSTRUCTOR_ARGUMENT_MISMATCH
 * @expect compile-fail
 * @section 6.1
 * @design Call context: 鏋勯€犲櫒璋冪敤瀹炲弬绫诲瀷(number)涓庡舰鍙傜被鍨?string)涓嶅尮閰嶄笖鏃犻殣寮忚浆鎹?
 * @note 鍙嶅悜鐢ㄤ緥锛氶獙璇佽鍦烘櫙搴斾骇鐢熺紪璇戞椂閿欒
 */
class Item {
  public label: string
  constructor(l: string) {
    this.label = l
  }
}

function testConstructorArgumentMismatchFail(): void {
  let item: Item = new Item(999)
}