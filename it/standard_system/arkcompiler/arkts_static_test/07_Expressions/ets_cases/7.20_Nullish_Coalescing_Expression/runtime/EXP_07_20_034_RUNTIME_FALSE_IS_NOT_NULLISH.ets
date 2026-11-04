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
 * @id EXP_07_20_034_RUNTIME_FALSE_IS_NOT_NULLISH
 * @expect runtime
 * @section 7.20
 * @design 验证 false 变量 ?? true 运行时结果为 false。
 *         false 不是 nullish 值，不会触发取 RHS。
 *         这是与 || 的关键区别：|| 将 false 视为 falsy，?? 不将 false 视为 nullish。
 * @note 运行时用例：false 变量 ?? true = false（false 非 nullish）
 */
function main(): void {
    let f: boolean = false;
    let result: boolean = f ?? true;
    if (result != false) {
    throw new Error('assertion failed: expected false, got ' + result);
  }
  }
  }
  }
    }
console.log('verified');
}
