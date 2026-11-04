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
 * @id NAM_04_01_008_PASS_QUALIFIED_NAME_INTERFACE_INSTANCE
 * @expect compile-pass
 * @section 4.1
 * @design 限定名访问接口类型变量的实例成员
 * @note 正向用例：验证接口类型变量可通过限定名访问实例成员
 */
interface NamedEntity {
    getName(): string;
}
class NamedEntityImpl implements NamedEntity {
    getName(): string { return "arkts"; }
}
let namedEntity: NamedEntity = new NamedEntityImpl();
let qualifiedInterfaceName: string = namedEntity.getName();
