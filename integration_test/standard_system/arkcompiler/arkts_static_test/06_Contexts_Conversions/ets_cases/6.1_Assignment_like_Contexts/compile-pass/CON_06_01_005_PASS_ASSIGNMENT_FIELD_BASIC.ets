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
 * @id CON_06_01_005_PASS_ASSIGNMENT_FIELD_BASIC
 * @expect compile-pass
 * @section 6.1
 * @design Assignment context: 瀵瑰璞″瓧娈电殑璧嬪€硷紝琛ㄨ揪寮忕被鍨嬩笌瀛楁绫诲瀷瀹屽叏鍖归厤
 * @note 姝ｅ悜鐢ㄤ緥锛氶獙璇佽鐗规€х紪璇戦€氳繃鐨勬纭敤娉?
 */
class Data {
  public value: int = 0
  public label: string = ''
}

function testAssignmentFieldBasic(): void {
  let d: Data = new Data()
  d.value = 100
  d.label = 'assigned'
}