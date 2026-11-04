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
 * @id NAM_04_02_107_FAIL_IMPORT_DUPLICATE
 * @expect compile-fail
 * @section 4.2
 * @design 导入声明与本地声明同名冲突
 * @note 反向用例：import引入的名称与本地声明冲突导致编译错误（单文件下用ambient模拟）
 */
declare function importedName(): void;
let importedName: number = 1;
