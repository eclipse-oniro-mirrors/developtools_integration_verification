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
 * @id NAM_04_07_07_102_FAIL_RETURN_IMPLICIT_UNDEFINED
 * @expect compile-fail
 * @section 4.7.7
 * @design 非 void/undefined 返回类型的空函数体
 * @note 反向用例：验证空函数体 + 非 void 返回类型编译错误
 *       规范 4.7.7 — 执行路径无 return/throw 语句时报错
 */
function emptyBody(): number {}
