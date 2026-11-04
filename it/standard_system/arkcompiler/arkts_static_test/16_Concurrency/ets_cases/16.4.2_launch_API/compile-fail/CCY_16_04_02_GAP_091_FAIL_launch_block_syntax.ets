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
 * @id CCY_16_04_02_GAP_091_FAIL_launch_block_syntax
 * @expect compile-fail
 * @section 16.4.2
 * @design GAP：Spec §16.4.2 示例 `launch { console.log(...)
}` 块语法不支持
 * @note 反向用例：验证 launch {} 无括号形式编译报错
 *       Spec 示例第 23 行：`launch { console.log("hello!")
}`
 *       ⚠️ SPEC 不一致：spec 允许 launch 后直接跟块，实现要求 launch() 括号形式
 *       分类：D 类（Spec 与实现不一致）
 */
function main(): void {
    launch { console.log('verified');
};
}
