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
 * @id NAM_04_04_007_PASS_NAMESPACE_EXPORT_QUALIFIED
 * @expect compile-pass
 * @section 4.4
 * @design namespace 导出实体通过限定名可访问
 * @note 正向用例：验证 namespace export 名称在外部必须通过 namespace 名称限定访问
 */
namespace QualifiedAccessNamespace {
    export let exportedValue: number = 10;
}
let namespaceQualifiedValue: number = QualifiedAccessNamespace.exportedValue;
