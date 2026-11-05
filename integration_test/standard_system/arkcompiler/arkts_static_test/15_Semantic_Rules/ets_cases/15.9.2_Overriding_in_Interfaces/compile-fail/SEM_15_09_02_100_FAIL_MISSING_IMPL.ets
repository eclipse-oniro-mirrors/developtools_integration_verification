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
 * @id SEM_15_09_02_100_FAIL_MISSING_IMPL
 * @expect compile-fail
 * @section 15.9.2
 * @design 验证接口方法未实现拒绝：缺少接口方法实现应报错
 * @note 反向用例：类声明 implements 但未提供方法实现
 */
interface Readable { read(): string; }
class FileStream implements Readable { }
function main(): void {}
