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
 * @id ERR_12_01_010_FAIL_THROW_OBJECT_NOT_ERROR
 * @expect compile-fail
 * @section 12.1
 * @design throw 的表达式类型必须 assignable to Error
 * @note 反向用例：普通对象非 Error 子类，不能被 throw
 */
class NotError {}
function testThrowObjectNotErrorFail(): void {
  throw new NotError()
}
