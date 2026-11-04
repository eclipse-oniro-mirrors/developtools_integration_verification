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
 * @id TYP_03_01_021_FAIL_OBJECT_ASSIGN_NULL
 * @expect compile-fail
 * @section 3.1
 * @design Object 类型不能接受 null/undefined 应编译失败: Object=null、Object=undefined、字段初始化为 null、参数传 null/undefined
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testObjectNullAssignFail(): void {
  let o: Object = null
  o = undefined
}

class TestObjectFieldFail {
  field: Object = null
}

function testObjectParamFail(p: Object): void {}
function caller(): void {
  testObjectParamFail(null)
  testObjectParamFail(undefined)
}