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
 * @id EXP_07_19_034_RUNTIME_FIELD_ACCESS
 * @expect runtime
 * @section 7.19
 * @design 验证 ! 字段访问在运行时非空时正常返回字段值
 * @note 运行时用例：obj!.field 正常返回值
 */
class DataBox {
    public value: int = 99
}

function main(): void {
    let b: DataBox | undefined = new DataBox()
    let v: int = b!.value
    if (v != 99) {
        throw new Error('assertion failed: expected 99, got ' + v)
    }
console.log('verified')
}
