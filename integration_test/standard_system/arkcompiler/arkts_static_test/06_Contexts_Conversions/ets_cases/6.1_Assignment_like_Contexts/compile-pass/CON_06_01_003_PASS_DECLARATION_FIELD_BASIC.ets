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
 * @id CON_06_01_003_PASS_DECLARATION_FIELD_BASIC
 * @expect compile-pass
 * @section 6.1
 * @design Declaration context: 绫诲瓧娈靛０鏄庡甫鏄惧紡绫诲瀷鏍囨敞鍜屽垵濮嬪€硷紝琛ㄨ揪寮忕被鍨嬩笌鐩爣绫诲瀷瀹屽叏鍖归厤
 * @note 姝ｅ悜鐢ㄤ緥锛氶獙璇佽鐗规€х紪璇戦€氳繃鐨勬纭敤娉?
 */
class MyClass {
  public numField: number = 100
  public strField: string = 'default'
  public boolField: boolean = true
  public intField: int = 0
}

function testDeclarationFieldBasic(): void {
  let obj: MyClass = new MyClass()
  let n: number = obj.numField
  let s: string = obj.strField
}