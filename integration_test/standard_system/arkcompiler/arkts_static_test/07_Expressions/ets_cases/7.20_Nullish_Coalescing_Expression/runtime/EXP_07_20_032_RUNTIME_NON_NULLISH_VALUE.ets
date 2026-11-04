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
 * @id EXP_07_20_032_RUNTIME_NON_NULLISH_VALUE
 * @expect runtime
 * @section 7.20
 * @design 验证非 nullish 变量 ?? default 运行时结果为 LHS 值。
 *         LHS 为非 nullish 值，取 LHS，RHS 不执行。
 * @note 运行时用例：非 nullish 变量 LHS = "hello"
 */
function main(): void {
    let v: string = 'hello';
    let result: string = v ?? 'world';
    if (result != 'hello') {
    throw new Error('assertion failed: expected 'hello', got ' + result);
  }
  }
  }
  }
    }
console.log('verified');
}
