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
 * @id EXP_07_06_04_009_RUNTIME_FIELD_ABRUPT
 * @expect runtime
 * @section 7.6.4
 * @design 字段表达式异常完成验证：第二个字段表达式抛出 Error，对象字面量求值终止，
 *         验证第一个字段已正确赋值，第二个字段未赋值
 * @runtime-throws=Error
 * @note 运行时用例：验证字段表达式异常导致字面量求值终止，前面字段已赋值
 */
class Data {
    public first: string = ''
    public second: string = ''
}

function throwExpr(): string {
    throw new Error('field expression failed')
}

function main(): void {
    let d: Data = {first: 'ok', second: throwExpr()}
    throw new Error('unreachable: field expression should have thrown')
}
