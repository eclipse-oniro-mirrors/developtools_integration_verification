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
 * @id EXP_07_17_02_012_RUNTIME_NON_SUBTYPE_CLASS_CAST_ERROR
 * @expect runtime
 * @runtime-throws=ClassCastError
 * @section 7.17.2
 * @design 验证非子类型 cast 运行时抛出 ClassCastError
 * @note 运行时用例：Object 类型 int 值 as string 应抛出 ClassCastError
 */
function main(): void {
    let x: Object = 42
    let s: string = x as string
}
