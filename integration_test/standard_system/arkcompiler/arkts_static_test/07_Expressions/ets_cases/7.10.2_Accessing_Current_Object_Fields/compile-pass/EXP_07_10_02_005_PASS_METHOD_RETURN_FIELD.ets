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
 * @id EXP_07_10_02_005_PASS_METHOD_RETURN_FIELD
 * @expect compile-pass
 * @section 7.10.2
 * @design 通过方法返回值访问字段：getObj().field 链式访问
 * @note 正向用例：验证 primaryExpression 可以是方法调用表达式
 */
class Wrapper {
    public value: int = 99
}
function create(): Wrapper {
    return new Wrapper()
}
let v: int = create().value
